import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:neon_chat/src/conversation/conversation.dart';
import 'package:neon_chat/src/conversations/conversations.dart';

part 'conversation_item.freezed.dart';

@freezed
class ConversationItem with _$ConversationItem {
  factory ConversationItem({
    required Conversation conversation,
    required ChatMessage lastMessage,
    // required String displayName,
    // required FirebaseUser conversationPartner,
    // String? thumbnail,
    required int unreadMessagesCount,
  }) = _ConversationItem;

  // factory ConversationItem.groupConversation({
  //   required Conversation conversation,
  //   required ChatMessage lastMessage,
  //   required String displayName,
  //   String? thumbnail,
  //   required int unreadMessagesCount,
  // }) = _GroupConversationItem;
}
