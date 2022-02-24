import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  String get _userId => firebaseAuth.currentUser!.uid;

  @override
  Future<Conversation> createConversations(String chatPersonId) async {
    final query = await _collection.where(firebaseKeys.conversationMembersKey,
        arrayContainsAny: [_userId]).get();
    final conversations = query.docs
        .map((e) => Conversation.fromJson(e.data() as Map<String, dynamic>))
        .toList();
    final list = conversations
        .where((element) => element.conversationMembers.contains(chatPersonId));
    if (list.isNotEmpty) {
      final conversation = list.first;
      if (conversation.hiddenFrom.contains(_userId)) {
        _unhideConversations(conversation.id);
      }
      return list.first;
    } else {
      final doc = _collection.doc();
      final conversation = Conversation(
        id: doc.id,
        conversationMembers: [chatPersonId, _userId],
        timestamp: DateTime.now(),
      );
      await doc.set(
        conversation.toJson(),
      );
      return conversation;
    }
  }

  @override
  Stream<List<Conversation>> getAllConversations() {
    return _collection
        .where(firebaseKeys.conversationMembersKey, arrayContainsAny: [_userId])
        .snapshots()
        .transform(
          StreamTransformer<QuerySnapshot<Map<String, dynamic>>,
              List<Conversation>>.fromHandlers(
            handleData: (
              QuerySnapshot<Map<String, dynamic>> data,
              EventSink<List<Conversation>> sink,
            ) async {
              final userId = firebaseAuth.currentUser?.uid;

              final snaps = data.docs
                  .map(
                    (doc) => doc.data(),
                  )
                  .toList();
              final chats = snaps
                  .map((json) => Conversation.fromJson(json))
                  .toList()
                ..removeWhere((element) => element.hiddenFrom.contains(userId));
              sink.add(chats);
            },
          ),
        );
  }

  @override
  Stream<int> getUnreadMessagesCount(String conversationId) {
    return _collection
        .doc(conversationId)
        .collection(firebaseKeys.messagesInConversationKey)
        .where(firebaseKeys.messageSenderIdKey, isNotEqualTo: _userId)
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
}