import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:neon_chat/neon_chat.dart';

class ConversationsRepositoryImpl implements ConversationsRepository {
  final FirebaseFirestore firestore;
  final FirebaseAuth firebaseAuth;
  final CollectionReference _collection;
  final FirebaseKeys firebaseKeys;

  ConversationsRepositoryImpl({
    required this.firestore,
    required this.firebaseAuth,
    required this.firebaseKeys,
  }) : _collection =
            firestore.collection(firebaseKeys.conversationsCollectionKey);

  User get _currentUser => firebaseAuth.currentUser!;

  @override
  Future<DirectConversation> createDirectConversation({
    required FirebaseUser me,
    required DirectConversationCreationData creationData,
  }) async {
    log('create conversation check user');
    final conversationPartner = creationData.conversationPartner;

    // This query checks whether a 1-on-1 conversation between [_userId]
    // and [conversationPartnerID] already exists to make sure chat rooms are
    // not duplicated.
    final query = await _collection
        .where(
          firebaseKeys.conversationMembersKey,
          arrayContains: conversationPartner.id,
        )
        .get();

    List<String> _members;
    _members = [conversationPartner.id];
    _members.add(_currentUser.uid);

    final conversationInfos = query.docs
        .map((e) => ConversationInfo.fromJson(e.data() as Map<String, dynamic>))
        .toList();

    final list = conversationInfos.where((element) {
      return listEquals(element.conversationMembers, _members);
    });

    if (list.isNotEmpty) {
      // There is already a conversation between the two users.
      final conversation = list.first;
      if (conversation.hiddenFrom.contains(_currentUser.uid)) {
        _unhideConversations(conversation.id);
      }
      log('create conversation: already a conversation between the two users');
      final existingConvo = DirectConversation.fromConversationInfo(
        info: list.first,
        otherUser: creationData.conversationPartner,
      );
      return existingConvo;
    } else {
      final doc = _collection.doc();
      final conversationInfo = ConversationInfo(
        id: doc.id,
        conversationMembers: [me.id, conversationPartner.id],
        createdAt: DateTime.now(),
        isGroupConversation: false,
        additionalData: creationData.additionalData,
      );
      await doc.set(conversationInfo.toJson());
      log('create conversation: new conversation');
      return DirectConversation.fromConversationInfo(
        info: conversationInfo,
        otherUser: creationData.conversationPartner,
      );
    }
  }

  @override
  Stream<List<ConversationInfo>> getAllConversationInfos() {
    return _collection
        .where(
          firebaseKeys.conversationMembersKey,
          arrayContains: _currentUser.uid,
        )
        .snapshots()
        .transform(
      StreamTransformer<QuerySnapshot<Map<String, dynamic>>,
          List<ConversationInfo>>.fromHandlers(
        handleData: (
          QuerySnapshot<Map<String, dynamic>> data,
          EventSink<List<ConversationInfo>> sink,
        ) async {
          final userId = firebaseAuth.currentUser?.uid;

          final snaps = data.docs.map((doc) => doc.data()).toList();

          final conversationInfos = snaps
              .map((json) => ConversationInfo.fromJson(json))
              .toList()
            ..removeWhere((element) => element.hiddenFrom.contains(userId));
          sink.add(conversationInfos);
        },
      ),
    );
  }

  @override
  Stream<int> getUnreadMessagesCount(String conversationId) {
    return _collection
        .doc(conversationId)
        .collection(firebaseKeys.messagesInConversationKey)
        .where(firebaseKeys.messageSenderIdKey, isNotEqualTo: _currentUser.uid)
        .where(firebaseKeys.messageSeenKey, isEqualTo: false)
        .where(firebaseKeys.messageDoneUploadKey, isEqualTo: true)
        .snapshots()
        .transform(
      StreamTransformer.fromHandlers(
        handleData: (QuerySnapshot<Map<String, dynamic>> data,
            EventSink<int> sink) async {
          sink.add(data.docs.length);
        },
      ),
    );
  }

  @override
  Stream<int> getUnreadGroupMessagesCount({
    required String conversationId,
    required Timestamp lastSeenTimestamp,
  }) {
    return _collection
        .doc(conversationId)
        .collection(firebaseKeys.messagesInConversationKey)
        .where(firebaseKeys.messageTimestampKey,
            isGreaterThan: lastSeenTimestamp)
        .where(firebaseKeys.messageDoneUploadKey, isEqualTo: true)
        .snapshots()
        .transform(
      StreamTransformer.fromHandlers(
        handleData: (QuerySnapshot<Map<String, dynamic>> data,
            EventSink<int> sink) async {
          // comment for future me: as of today (01.04.2022), lazy-ass firebase
          // only allows queries with inequality operators on just one field,
          // so you cannot check for uid != currentUid AND
          // timestamp < lastSeenTimestamp.
          //
          // So we query for the timestamp argument (more gets filtered out)
          // and then filter out our own messages locally. wtf google.
          final unreadMessagesNotFromMe = data.docs.where((doc) =>
              doc.data()[firebaseKeys.messageSenderIdKey] != _currentUser.uid);

          sink.add(unreadMessagesNotFromMe.length);
        },
      ),
    );
  }

  @override
  Stream<ConversationInfo> getConversationInfo(String conversationId) {
    return _collection.doc(conversationId).snapshots().transform(
      StreamTransformer<DocumentSnapshot<Map<String, dynamic>>,
          ConversationInfo>.fromHandlers(
        handleData: (
          DocumentSnapshot<Map<String, dynamic>> snap,
          EventSink<ConversationInfo> sink,
        ) async {
          sink.add(
              ConversationInfo.fromJson(snap.data() as Map<String, dynamic>));
        },
      ),
    );
  }

  void _unhideConversations(String conversationId) async {
    final userId = firebaseAuth.currentUser?.uid;

    _collection.doc(conversationId).update(
      {
        firebaseKeys.conversationHiddenFromKey: FieldValue.arrayRemove(
          [userId],
        ),
      },
    );
  }

  @override
  void hideConversations(String conversationId) async {
    final userId = firebaseAuth.currentUser?.uid;

    _collection.doc(conversationId).update(
      {
        firebaseKeys.conversationHiddenFromKey: FieldValue.arrayUnion(
          [userId],
        ),
      },
    );
  }

  @override
  Future<GroupConversation> createGroupConversation({
    required FirebaseUser me,
    required GroupConversationCreationData creationData,
  }) async {
    //TODO: thumbnail should be uploaded somewhere -> implement that in upload_manager_impl

    final doc = _collection.doc();
    final conversationInfo = ConversationInfo(
      id: doc.id,
      conversationMembers: [
        ...List<String>.from(creationData.conversationMembers.map((e) => e.id)),
        me.id,
      ],
      createdAt: DateTime.now(),
      groupName: creationData.groupName,
      groupPicture: creationData.groupPhoto,
      isGroupConversation: true,
      additionalData: creationData.additionalData,
    );
    await doc.set(conversationInfo.toJson());
    return GroupConversation.fromConversationInfo(
      info: conversationInfo,
      convoMembers: [...creationData.conversationMembers, me],
    );
  }
}
