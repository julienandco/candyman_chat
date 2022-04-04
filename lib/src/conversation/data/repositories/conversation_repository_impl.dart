import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import 'package:neon_chat/neon_chat.dart';

@LazySingleton(as: ConversationRepository)
class ConversationRepositoryImpl implements ConversationRepository {
  final FirebaseFirestore firestore;
  final FirebaseAuth firebaseAuth;
  final CollectionReference _conversations;
  final FirebaseKeys firebaseKeys;
  ConversationRepositoryImpl({
    required this.firestore,
    required this.firebaseAuth,
    this.firebaseKeys = const FirebaseKeys(),
  }) : _conversations =
            firestore.collection(firebaseKeys.conversationsCollectionKey);

  @override
  Stream<List<ChatMessage>> getMessages(String conversationId) {
    return _conversations
        .doc(conversationId)
        .collection(firebaseKeys.messagesInConversationKey)
        .orderBy(firebaseKeys.messageTimestampKey, descending: true)
        .snapshots()
        .transform(
      StreamTransformer<QuerySnapshot<Map<String, dynamic>>,
          List<ChatMessage>>.fromHandlers(
        handleData: (QuerySnapshot<Map<String, dynamic>> data,
            EventSink<List<ChatMessage>> sink) async {
          final snaps = data.docs.map((doc) => doc.data()).toList();

          var messages = List<ChatMessage>.from([]);

          for (var json in snaps) {
            final message = ChatMessage.fromJson(json);

            final userId = firebaseAuth.currentUser?.uid;

            if (!message.hiddenFrom.contains(userId)) messages.add(message);
          }

          sink.add(messages);
        },
      ),
    );
  }

  @override
  void sendMessage(String conversationId, ChatMessage message) async {
    try {
      final doc = _conversations
          .doc(conversationId)
          .collection(firebaseKeys.messagesInConversationKey)
          .doc();

      doc.set(message.copyWith(doneUpload: true, id: doc.id).toJson());

      log('sent message', name: '$runtimeType');
    } catch (err) {
      log('$err', name: '$runtimeType');
      rethrow;
    }
  }

  @override
  Stream<ChatMessage> getLastMessages(String conversationId) {
    final userId = firebaseAuth.currentUser?.uid;

    return _conversations
        .doc(conversationId)
        .collection(firebaseKeys.messagesInConversationKey)
        .where(firebaseKeys.messageDoneUploadKey, isEqualTo: true)
        .orderBy(firebaseKeys.messageTimestampKey, descending: true)
        .limit(1)
        .snapshots()
        .transform(
      StreamTransformer<QuerySnapshot<Map<String, dynamic>>,
          ChatMessage>.fromHandlers(
        handleData: (QuerySnapshot<Map<String, dynamic>> data,
            EventSink<ChatMessage> sink) async {
          if (data.docs.isNotEmpty) {
            final snap = data.docs.map((doc) => doc.data()).toList().first;

            var message = ChatMessage.fromJson(snap);

            if (message.hiddenFrom.contains(userId)) {
              message = message.copyWith(type: ChatMessageType.deleted);
            }
            sink.add(message);
          } else {
            sink.add(ChatMessage.empty());
          }
        },
      ),
    );
  }

  @override
  ChatUploadFile sendFileMessage(String conversationId, ChatMessage message) {
    try {
      final doc = _conversations
          .doc(conversationId)
          .collection(firebaseKeys.messagesInConversationKey)
          .doc();

      doc.set(message.copyWith(doneUpload: false, id: doc.id).toJson());

      log('sent file message', name: '$runtimeType');
      return ChatUploadFile(
        messageId: doc.id,
        conversationID: conversationId,
        filePath: message.filePath!,
        status: ChatUploadFileStatus.none,
      );
    } catch (err) {
      log('$err', name: '$runtimeType');
      rethrow;
    }
  }

  @override
  void markAsSeen(String conversationId, ChatMessage message) {
    if (!message.isMe && message.doneUpload && !message.seen) {
      _conversations
          .doc(conversationId)
          .collection(firebaseKeys.messagesInConversationKey)
          .doc(message.id)
          .update(
        {
          firebaseKeys.messageSeenKey: true,
        },
      );
    }
  }

  @override
  void deleteMessage(String conversationId, ChatMessage message) {
    _conversations
        .doc(conversationId)
        .collection(firebaseKeys.messagesInConversationKey)
        .doc(message.id)
        .update(
      {
        firebaseKeys.messageTypeKey: ChatMessageType.deleted.firebaseKey,
      },
    );
  }

  @override
  void hideMessage(String conversationId, ChatMessage message) {
    final userId = firebaseAuth.currentUser?.uid;

    _conversations
        .doc(conversationId)
        .collection(firebaseKeys.messagesInConversationKey)
        .doc(message.id)
        .update(
      {
        firebaseKeys.messageHiddenFromKey: FieldValue.arrayUnion([userId]),
      },
    );
  }

  @override
  Stream<String> getDisplayName(String conversationId) {
    return _conversations.doc(conversationId).snapshots().transform(
      StreamTransformer<DocumentSnapshot<Map<String, dynamic>>,
          String>.fromHandlers(
        handleData: (DocumentSnapshot<Map<String, dynamic>> doc,
            EventSink<String> sink) async {
          final data = doc.data();
          if (data != null &&
              data.containsKey(firebaseKeys.conversationGroupNameKey)) {
            final displayName = data[firebaseKeys.conversationGroupNameKey];

            sink.add(displayName);
          } else {
            sink.add('PROBLEM'); //TODO
          }
        },
      ),
    );
  }

  @override
  Stream<String?> getThumbnail(String conversationId) {
    return _conversations.doc(conversationId).snapshots().transform(
      StreamTransformer<DocumentSnapshot<Map<String, dynamic>>,
          String?>.fromHandlers(
        handleData: (DocumentSnapshot<Map<String, dynamic>> doc,
            EventSink<String?> sink) async {
          final data = doc.data();
          if (data != null &&
              data.containsKey(firebaseKeys.conversationGroupPictureKey)) {
            final thumbnailString =
                data[firebaseKeys.conversationGroupPictureKey];

            sink.add(thumbnailString);
          }
        },
      ),
    );
  }
}
