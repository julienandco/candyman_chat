import 'package:freezed_annotation/freezed_annotation.dart';

//TODO import
import 'package:neon_chat/src/conversations/domain/entities/conversation/conversation.dart';
import 'package:neon_chat/src/core/domain/entities/firebase_user/firebase_user.dart';

part 'conversation_item.freezed.dart';

@freezed
class ConversationItem with _$ConversationItem {
  factory ConversationItem({
    required Conversation conversation,
    //TODO
    // required ChatMessage lastMessage,
    required FirebaseUser conversationPartner,
    required int unreadMessagesCount,
  }) = _ConversationItem;
}

//TODO: old
// import 'package:equatable/equatable.dart';

// import 'package:papeo_app/core/data/models/firestore_user.dart';
// import 'package:papeo_app/features/chat/data/models/chat_message_model.dart';
// import 'package:papeo_app/features/chats/data/models/conversation_model.dart';

// class ConversationItem extends Equatable {
//   final ConversationModel converstaion;
//   final FirebaseUser user;
//   final ChatMessageModel lastMessage;
//   final int unreadMessagesCount;
//   ConversationItem({
//     required this.converstaion,
//     required this.user,
//     required this.lastMessage,
//     required this.unreadMessagesCount,
//   });

//   @override
//   List<Object> get props => [
//         converstaion,
//         user,
//         lastMessage,
//         unreadMessagesCount,
//       ];
//   bool get isPartyChat => converstaion.partyId != null;
// }
