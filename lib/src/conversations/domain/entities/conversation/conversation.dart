import 'package:freezed_annotation/freezed_annotation.dart';

part 'conversation.freezed.dart';
part 'conversation.g.dart';

@freezed
class Conversation with _$Conversation {
  factory Conversation({
    required String id,
    String? displayName,
    required List<String> conversationMembers,
    String? thumbnail,
    DateTime? timestamp,
    @Default([]) List<String> hiddenFrom,
  }) = _Conversation;

  factory Conversation.fromJson(Map<String, dynamic> json) =>
      _$ConversationFromJson(json);
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

