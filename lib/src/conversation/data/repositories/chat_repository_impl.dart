import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

//TODO: need/can inject?
import 'package:injectable/injectable.dart';
import 'package:neon_chat/src/conversation/conversation.dart';

const _conversationsCollectionName = 'conversations';
const _messageCollectionName = 'messages';

// @LazySingleton(as: ChatRepository)
class ChatRepositoryImpl implements ChatRepository {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;
  final CollectionReference _conversations;
  ChatRepositoryImpl(this.firestore, this.auth)
      : _conversations = firestore.collection(_conversationsCollectionName);

  @override
  Stream<List<ChatMessage>> getMessages(String conversationId) {
    return _conversations
        .doc(conversationId)
        .collection(_messageCollectionName)
        .orderBy('timestamp', descending: true)
        .snapshots()
        .transform(
      StreamTransformer<QuerySnapshot<Map<String, dynamic>>,
          List<ChatMessage>>.fromHandlers(
        handleData: (QuerySnapshot<Map<String, dynamic>> data,
            EventSink<List<ChatMessage>> sink) async {
          final snaps = data.docs
              .map(
                (doc) => doc.data(),
              )
              .toList();
          var messages = List<ChatMessage>.from([]);
          for (var json in snaps) {
            final message = ChatMessage.fromJson(json);
            final userId = auth.currentUser?.uid;
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
          .collection(_messageCollectionName)
          .doc();
      doc.set(
        message
            .copyWith(
              doneUpload: true,
              id: doc.id,
            )
            .toJson(),
      );
      log('sent message', name: '$runtimeType');
    } catch (err) {
      log('$err', name: '$runtimeType');
      rethrow;
    }
  }

  @override
  Stream<ChatMessage> getLastMessages(String conversationId) {
    final userId = auth.currentUser?.uid;

    return _conversations
        .doc(conversationId)
        .collection(_messageCollectionName)
        .where('doneUpload', isEqualTo: true)
        .orderBy('timestamp', descending: true)
        .limit(1)
        .snapshots()
        .transform(
      StreamTransformer<QuerySnapshot<Map<String, dynamic>>,
          ChatMessage>.fromHandlers(
        handleData: (QuerySnapshot<Map<String, dynamic>> data,
            EventSink<ChatMessage> sink) async {
          if (data.docs.isNotEmpty) {
            final snap = data.docs
                .map(
                  (doc) => doc.data(),
                )
                .toList()
                .first;
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
          .collection(_messageCollectionName)
          .doc();
      doc.set(
        message
            .copyWith(
              doneUpload: false,
              id: doc.id,
            )
            .toJson(),
      );
      log('sent message', name: '$runtimeType');
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
          .collection(_messageCollectionName)
          .doc(message.id)
          .update(
        {
          'seen': true,
        },
      );
    }
  }

  @override
  void deleteMessage(String conversationId, ChatMessage message) {
    _conversations
        .doc(conversationId)
        .collection(_messageCollectionName)
        .doc(message.id)
        .update(
      {'type': 'deleted'},
    );
  }

  @override
  void hideMessage(String conversationId, ChatMessage message) {
    final userId = auth.currentUser?.uid;

    _conversations
        .doc(conversationId)
        .collection(_messageCollectionName)
        .doc(message.id)
        .update(
      {
        'hiddenFrom': FieldValue.arrayUnion(
          [userId],
        ),
      },
    );
  }

  //TODO: old
  // @override
  // Stream<List<ChatMessageModel>> getMessages(String conversationId) {
  //   return _conversations
  //       .doc(conversationId)
  //       .collection('messages')
  //       .orderBy('timestamp', descending: true)
  //       .snapshots()
  //       .transform(
  //     StreamTransformer<QuerySnapshot<Map<String, dynamic>>,
  //         List<ChatMessageModel>>.fromHandlers(
  //       handleData: (QuerySnapshot<Map<String, dynamic>> data,
  //           EventSink<List<ChatMessageModel>> sink) async {
  //         final snaps = data.docs
  //             .map(
  //               (doc) => doc.data(),
  //             )
  //             .toList();
  //         var messages = List<ChatMessageModel>.from([]);
  //         for (var json in snaps) {
  //           final message = ChatMessageModel.fromMap(json);
  //           final userId = auth.currentUser?.uid;
  //           if (!message.hiddenFrom.contains(userId)) messages.add(message);
  //         }

  //         sink.add(messages);
  //       },
  //     ),
  //   );
  // }

  // @override
  // void sendMessage(String conversationId, ChatMessageModel message) async {
  //   try {
  //     final doc =
  //         _conversations.doc(conversationId).collection('messages').doc();
  //     doc.set(
  //       message
  //           .copyWith(
  //             doneUpload: true,
  //             id: doc.id,
  //           )
  //           .toMap(),
  //     );
  //     print('sentmessage');
  //   } catch (err) {
  //     print(err);
  //     rethrow;
  //   }
  // }

  // @override
  // Stream<ChatMessageModel> getLastMessages(String conversationId) {
  //   final userId = auth.currentUser?.uid;

  //   return _conversations
  //       .doc(conversationId)
  //       .collection('messages')
  //       .where('doneUpload', isEqualTo: true)
  //       .orderBy('timestamp', descending: true)
  //       .limit(1)
  //       .snapshots()
  //       .transform(
  //     StreamTransformer<QuerySnapshot<Map<String, dynamic>>,
  //         ChatMessageModel>.fromHandlers(
  //       handleData: (QuerySnapshot<Map<String, dynamic>> data,
  //           EventSink<ChatMessageModel> sink) async {
  //         if (data.docs.isNotEmpty) {
  //           final snap = data.docs
  //               .map(
  //                 (doc) => doc.data(),
  //               )
  //               .toList()
  //               .first;
  //           var message = ChatMessageModel.fromMap(snap);
  //           if (message.hiddenFrom.contains(userId)) {
  //             message = message.copyWith(type: ChatMessageType.deleted);
  //           }
  //           sink.add(message);
  //         } else {
  //           sink.add(ChatMessageModel.empty());
  //         }
  //       },
  //     ),
  //   );
  // }

  // @override
  // ChatUploadFile sendFileMessage(
  //     String conversationId, ChatMessageModel message) {
  //   try {
  //     final doc =
  //         _conversations.doc(conversationId).collection('messages').doc();
  //     doc.set(
  //       message
  //           .copyWith(
  //             doneUpload: false,
  //             id: doc.id,
  //           )
  //           .toMap(),
  //     );
  //     print('sentmessage');
  //     return ChatUploadFile(
  //       messageId: doc.id,
  //       conversationID: conversationId,
  //       filePath: message.filePath!,
  //       status: ChatUploadFileStatus.none,
  //     );
  //   } catch (err) {
  //     print(err);
  //     rethrow;
  //   }
  // }

  // @override
  // void markAsSeen(String conversationId, ChatMessageModel message) {
  //   if (!message.isMe && message.doneUpload && !message.seen) {
  //     _conversations
  //         .doc(conversationId)
  //         .collection('messages')
  //         .doc(message.id)
  //         .update(
  //       {
  //         'seen': true,
  //       },
  //     );
  //   }
  // }

  // @override
  // void deleteMessage(String conversationId, ChatMessageModel message) {
  //   _conversations
  //       .doc(conversationId)
  //       .collection('messages')
  //       .doc(message.id)
  //       .update(
  //     {'type': 'deleted'},
  //   );
  // }

  // @override
  // void hideMessage(String conversationId, ChatMessageModel message) {
  //   final userId = auth.currentUser?.uid;

  //   _conversations
  //       .doc(conversationId)
  //       .collection('messages')
  //       .doc(message.id)
  //       .update(
  //     {
  //       'hiddenFrom': FieldValue.arrayUnion(
  //         [userId],
  //       ),
  //     },
  //   );
  // }
}
