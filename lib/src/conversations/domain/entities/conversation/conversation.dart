import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:neon_chat/src/core/data/models/my_datetime_converter.dart';

part 'conversation.freezed.dart';
part 'conversation.g.dart';

@freezed
class Conversation with _$Conversation {
  const Conversation._();

  // static _dateTimeToJson(_) => FieldValue.serverTimestamp();
  // static _dateTimeFromJson(Timestamp? timestamp) => timestamp?.toDate();

  // @JsonKey(toJson: _dateTimeToJson, fromJson: _dateTimeFromJson)
  // final DateTime? timestamp;

  factory Conversation({
    required String id,
    String? displayName,
    required List<String> conversationMembers,
    String? thumbnail,
    @MyDateTimeConverter() DateTime? timestamp,
    @Default([]) List<String> hiddenFrom,
  }) = _Conversation;

  factory Conversation.fromJson(Map<String, dynamic> json) =>
      _$ConversationFromJson(json);

//TODO: injection?
  String get receiverId => conversationMembers.firstWhere(
        (element) => element != FirebaseAuth.instance.currentUser!.uid,
        // (element) => element != getIt<FirebaseAuth>().currentUser!.uid,
      );

  //TODO: injection?
  /// return whether the conversation is hidden from the current user
  bool get isHidden => hiddenFrom.contains(
        FirebaseAuth.instance.currentUser!.uid,
        // (element) => element == getIt<FirebaseAuth>().currentUser!.uid,
      );
}

//TODO: old
// import 'package:equatable/equatable.dart';

// class ConversationEntity extends Equatable {
//   final String id;
//   final String? displayName;
//   final List<String> members;
//   final String? partyId;
//   final String? thumbnail;
//   final DateTime? timestamp;
//   final List<String> hiddenFrom;

//   ConversationEntity({
//     required this.id,
//     this.displayName,
//     required this.members,
//     this.partyId,
//     this.thumbnail,
//     this.timestamp,
//     this.hiddenFrom = const [],
//   });

//   @override
//   List<Object?> get props {
//     return [
//       id,
//       displayName,
//       members,
//       partyId,
//       thumbnail,
//       timestamp,
//       hiddenFrom,
//     ];
//   }
// }

