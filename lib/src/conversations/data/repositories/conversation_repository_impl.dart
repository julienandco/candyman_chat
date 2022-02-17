import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import 'package:neon_chat/src/conversations/conversations.dart';

// @LazySingleton(as: ConversationRepository)
class ConversationRepositoryImpl implements ConversationRepository {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;
  final CollectionReference _collection;

  ConversationRepositoryImpl(
    this.firestore,
    this.auth,
  ) : _collection = firestore.collection('conversations');

  String get _userId => auth.currentUser!.uid;

  @override
  Future<Conversation> createConversations(String chatPersonId) async {
    final query = await _collection
        .where('members', arrayContainsAny: [_userId])
        .where('partyId', isNull: true)
        .get();
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
        .where('members', arrayContainsAny: [_userId])
        .snapshots()
        .transform(
          StreamTransformer<QuerySnapshot<Map<String, dynamic>>,
              List<Conversation>>.fromHandlers(
            handleData: (
              QuerySnapshot<Map<String, dynamic>> data,
              EventSink<List<Conversation>> sink,
            ) async {
              final userId = auth.currentUser?.uid;

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
  Stream<int> getUnreadMessagesCount(String converstaionId) {
    return _collection
        .doc(converstaionId)
        .collection('messages')
        .where('senderId', isNotEqualTo: _userId)
        .where('seen', isEqualTo: false)
        .where('doneUpload', isEqualTo: true)
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
    final userId = auth.currentUser?.uid;

    _collection.doc(conversationId).update(
      {
        'hiddenFrom': FieldValue.arrayRemove(
          [userId],
        ),
      },
    );
  }

  @override
  void hideConversations(String conversationId) async {
    final userId = auth.currentUser?.uid;

    _collection.doc(conversationId).update(
      {
        'hiddenFrom': FieldValue.arrayUnion(
          [userId],
        ),
      },
    );
  }
}

//TODO: old
// import 'dart:async';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:injectable/injectable.dart';
// import 'package:papeo_app/features/chats/data/models/conversation_model.dart';
// import 'package:papeo_app/features/chats/domain/repository/conversation_repository.dart';

// @LazySingleton(as: ConversationRepository)
// class ConversationRepositoryImpl implements ConversationRepository {
//   final FirebaseFirestore firestore;
//   final FirebaseAuth auth;
//   final CollectionReference _collection;

//   ConversationRepositoryImpl(
//     this.firestore,
//     this.auth,
//   ) : _collection = firestore.collection('conversations');

//   String get _userId => auth.currentUser!.uid;

//   @override
//   Future<ConversationModel> createConversations(String chatPersonId) async {
//     final query = await _collection
//         .where('members', arrayContainsAny: [_userId])
//         .where('partyId', isNull: true)
//         .get();
//     final converstaions = query.docs
//         .map((e) => ConversationModel.fromMap(e.data() as Map<String, dynamic>))
//         .toList();
//     final list = converstaions
//         .where((element) => element.members.contains(chatPersonId));
//     if (list.isNotEmpty) {
//       final conversation = list.first;
//       if (conversation.hiddenFrom.contains(_userId)) {
//         _unhideConversations(conversation.id);
//       }
//       return list.first;
//     } else {
//       final doc = _collection.doc();
//       final converstaion = ConversationModel(
//         id: doc.id,
//         members: [chatPersonId, _userId],
//         timestamp: DateTime.now(),
//       );
//       await doc.set(
//         converstaion.toMap(),
//       );
//       return converstaion;
//     }
//   }

//   @override
//   Stream<List<ConversationModel>> getAllConversations() {
//     return _collection
//         .where('members', arrayContainsAny: [_userId])
//         .snapshots()
//         .transform(
//           StreamTransformer<QuerySnapshot<Map<String, dynamic>>,
//               List<ConversationModel>>.fromHandlers(
//             handleData: (
//               QuerySnapshot<Map<String, dynamic>> data,
//               EventSink<List<ConversationModel>> sink,
//             ) async {
//               final userId = auth.currentUser?.uid;

//               final snaps = data.docs
//                   .map(
//                     (doc) => doc.data(),
//                   )
//                   .toList();
//               final chats = snaps
//                   .map((json) => ConversationModel.fromMap(json))
//                   .toList()
//                 ..removeWhere((element) => element.hiddenFrom.contains(userId));
//               sink.add(chats);
//             },
//           ),
//         );
//   }

//   @override
//   Stream<int> getUnreadMessagesCount(String converstaionId) {
//     return _collection
//         .doc(converstaionId)
//         .collection('messages')
//         .where('senderId', isNotEqualTo: _userId)
//         .where('seen', isEqualTo: false)
//         .where('doneUpload', isEqualTo: true)
//         .snapshots()
//         .transform(
//       StreamTransformer.fromHandlers(
//         handleData: (QuerySnapshot<Map<String, dynamic>> data,
//             EventSink<int> sink) async {
//           sink.add(data.docs.length);
//         },
//       ),
//     );
//   }

//   @override
//   Stream<ConversationModel> getConversation(String conversationId) {
//     return _collection.doc(conversationId).snapshots().transform(
//       StreamTransformer<DocumentSnapshot<Map<String, dynamic>>,
//           ConversationModel>.fromHandlers(
//         handleData: (
//           DocumentSnapshot<Map<String, dynamic>> snap,
//           EventSink<ConversationModel> sink,
//         ) async {
//           sink.add(
//               ConversationModel.fromMap(snap.data() as Map<String, dynamic>));
//         },
//       ),
//     );
//   }

//   void _unhideConversations(String conversationId) async {
//     final userId = auth.currentUser?.uid;

//     _collection.doc(conversationId).update(
//       {
//         'hiddenFrom': FieldValue.arrayRemove(
//           [userId],
//         ),
//       },
//     );
//   }

//   @override
//   void hideConversations(String conversationId) async {
//     final userId = auth.currentUser?.uid;

//     _collection.doc(conversationId).update(
//       {
//         'hiddenFrom': FieldValue.arrayUnion(
//           [userId],
//         ),
//       },
//     );
//   }
// }
