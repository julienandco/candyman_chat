import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:neon_chat/neon_chat.dart';

import 'package:rxdart/rxdart.dart';

class InitializeConversationItemStreamUC {
  final ConversationsRepository conversationsRepository;
  final ConversationRepository conversationRepository;

  InitializeConversationItemStreamUC({
    required this.conversationRepository,
    required this.conversationsRepository,
  });

  StreamSubscription<ConversationItem> call({
    required Conversation conversation,
    required Function(ConversationItem) onData,
    required Timestamp timestamp,
    Function? onError,
  }) {
    return CombineLatestStream.combine2(
      conversationRepository.getLastMessages(conversation.id),
      conversation.isGroupChat
          ? conversationsRepository.getUnreadGroupMessagesCount(
              conversationId: conversation.id,
              lastSeenTimestamp: timestamp,
            )
          : conversationsRepository.getUnreadMessagesCount(conversation.id),
      (
        ChatMessage lastMessage,
        int unreadCount,
      ) =>
          ConversationItem(
        lastMessage: lastMessage,
        conversation: conversation,
        unreadMessagesCount: unreadCount,
      ),
    ).listen(
      onData,
      onError: onError,
    );
  }
}
