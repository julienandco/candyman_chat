import 'dart:async';

import 'package:neon_chat/src/conversation/conversation.dart';
import 'package:neon_chat/src/conversations/conversations.dart';
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
    Function? onError,
  }) {
    return CombineLatestStream.combine2(
      conversationRepository.getLastMessages(conversation.id),
      conversationsRepository.getUnreadMessagesCount(conversation.id),
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
    // }
  }
}
