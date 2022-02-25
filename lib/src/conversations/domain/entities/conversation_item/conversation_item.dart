import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:neon_chat/src/conversation/conversation.dart';
import 'package:neon_chat/src/conversations/conversations.dart';
import 'package:neon_chat/src/core/core.dart';

part 'conversation_item.freezed.dart';

@freezed
class ConversationItem with _$ConversationItem {
  factory ConversationItem({
    required Conversation conversation,
    required ChatMessage lastMessage,
    required FirebaseUser conversationPartner,
    required int unreadMessagesCount,
  }) = _ConversationItem;
}
