import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
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
    //TODOGROUPSEEN
    //fetch timestamp from cache and if cache flag is empty, get it from firebase
    final timestamp = Timestamp.fromDate(DateTime(2022, 03, 30, 15, 45));
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
    // }
  }
}
