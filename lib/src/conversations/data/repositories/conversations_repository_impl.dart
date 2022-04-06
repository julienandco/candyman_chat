import 'dart:async';

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
    this.firebaseKeys = const FirebaseKeys(),
  }) : _collection =
            firestore.collection(firebaseKeys.conversationsCollectionKey);

  User get _currentUser => firebaseAuth.currentUser!;

  @override
  Future<Conversation> createConversation({
    required FirebaseUser me,
    required DirectConversationCreationData creationData,
  }) async {
    final conversationPartner = creationData.conversationPartner;

    // This query checks whether a 1-on-1 conversation between [_userId]
    // and [conversationPartnerID] already exists to make sure chat rooms are
    // not duplicated.
    final query = await _collection
        .where(
            '${firebaseKeys.conversationMembersKey}.${conversationPartner.id}',
            isNull: false)
        .get();

    List<String> _members;
    _members = [conversationPartner.id];
    _members.add(_currentUser.uid);

    final conversations = query.docs
        .map((e) => Conversation.fromJson(e.data() as Map<String, dynamic>))
        .toList();

    final list = conversations.where((element) {
      return listEquals(
          List<String>.from(element.conversationMembers.map((user) => user.id)),
          _members);
    });

    if (list.isNotEmpty) {
      // There is already a conversation between the two users.
      final conversation = list.first;
      if (conversation.hiddenFrom.contains(_currentUser.uid)) {
        _unhideConversations(conversation.id);
      }
      return list.first;
    } else {
      final doc = _collection.doc();
      final conversation = Conversation(
        id: doc.id,
        conversationMembers: [me, conversationPartner],
        createdAt: DateTime.now(),
        isGroupConversation: false,
      );
      await doc.set(conversation.toJson());
      return conversation;
    }
  }

  @override
  Stream<List<Conversation>> getAllConversations() {
    return _collection
        .where('${firebaseKeys.conversationMembersKey}.${_currentUser.uid}',
            isNull: false)
        .snapshots()
        .transform(
      StreamTransformer<QuerySnapshot<Map<String, dynamic>>,
          List<Conversation>>.fromHandlers(
        handleData: (
          QuerySnapshot<Map<String, dynamic>> data,
          EventSink<List<Conversation>> sink,
        ) async {
          final userId = firebaseAuth.currentUser?.uid;

          final snaps = data.docs.map((doc) => doc.data()).toList();

          final conversations = snaps
              .map((json) => Conversation.fromJson(json))
              .toList()
            ..removeWhere((element) => element.hiddenFrom.contains(userId));
          sink.add(conversations);
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
  Stream<Conversation> getConversation(String conversationId) {
    return _collection.doc(conversationId).snapshots().transform(
      StreamTransformer<DocumentSnapshot<Map<String, dynamic>>,
          Conversation>.fromHandlers(
        handleData: (
          DocumentSnapshot<Map<String, dynamic>> snap,
          EventSink<Conversation> sink,
        ) async {
          sink.add(Conversation.fromJson(snap.data() as Map<String, dynamic>));
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
  Future<Conversation> createGroupConversation({
    required FirebaseUser me,
    required GroupConversationCreationData creationData,
  }) async {
    //TODO: thumbnail should be uploaded somewhere

    final doc = _collection.doc();
    final conversation = Conversation(
      id: doc.id,
      conversationMembers: [...creationData.conversationMembers, me],
      createdAt: DateTime.now(),
      groupName: creationData.groupName,
      groupPicture: creationData.groupPhoto,
      isGroupConversation: true,
    );
    await doc.set(conversation.toJson());
    return conversation;
  }
}
