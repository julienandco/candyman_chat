// // ignore_for_file: iterable_contains_unrelated_type

//TODO: old -> remove as not need anymore cos of freezd
// import 'dart:convert';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:papeo_app/features/chats/domain/entities/conversation.dart';
// import 'package:papeo_app/injection.dart';

// class ConversationModel extends ConversationEntity {
//   ConversationModel({
//     required String id,
//     String? displayName,
//     required List<String> members,
//     String? partyId,
//     String? thumbnail,
//     DateTime? timestamp,
//     List<String> hiddenFrom = const [],
//   }) : super(
//           id: id,
//           displayName: displayName,
//           members: members,
//           partyId: partyId,
//           thumbnail: thumbnail,
//           timestamp: timestamp,
//           hiddenFrom: hiddenFrom,
//         );
//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'displayName': displayName,
//       'members': members,
//       'partyId': partyId,
//       'thumbnail': thumbnail,
//       'timestamp': FieldValue.serverTimestamp(),
//       'hiddenFrom': hiddenFrom,
//     };
//   }

//   factory ConversationModel.fromMap(Map<String, dynamic> map) {
//     final timestamp = (map['timestamp'] as Timestamp?);
//     return ConversationModel(
//       id: map['id'],
//       displayName: map['title'],
//       members: List<String>.from(map['members']),
//       partyId: map['partyId'],
//       thumbnail: map['thumbnail'],
//       timestamp: timestamp?.toDate(),
//       hiddenFrom: List<String>.from(
//         map['hiddenFrom'] ?? [],
//       ),
//     );
//   }
//   String get receiverId => members.firstWhere(
//         (element) => element != getIt<FirebaseAuth>().currentUser!.uid,
//       );

//   /// return if the converation is hidden from the current user
//   bool get isHidden => hiddenFrom.contains(
//         (element) => element == getIt<FirebaseAuth>().currentUser!.uid,
//       );
//   factory ConversationModel.fromJson(String source) =>
//       ConversationModel.fromMap(json.decode(source));
//   bool get isPartyChat => partyId != null;
// }
