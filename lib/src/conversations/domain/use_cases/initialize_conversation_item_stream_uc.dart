import 'dart:async';

import 'package:neon_chat/src/conversation/conversation.dart';
import 'package:neon_chat/src/conversations/conversations.dart';
import 'package:neon_chat/src/core/domain/domain.dart';
import 'package:rxdart/rxdart.dart';

class InitializeConversationItemStreamUC {
  final ConversationsRepository conversationsRepository;
  final ConversationRepository conversationRepository;
  final FirebaseUserProfileRepository userProfileRepository;

  InitializeConversationItemStreamUC({
    required this.conversationRepository,
    required this.conversationsRepository,
    required this.userProfileRepository,
  });

  StreamSubscription<ConversationItem> call({
    required String otherUserId,
    required Conversation conversation,
    required Function(ConversationItem) onData,
    Function? onError,
  }) {
    return CombineLatestStream.combine3(
      conversationRepository.getLastMessages(conversation.id),
      userProfileRepository.getUserProfile(otherUserId),
      conversationsRepository.getUnreadMessagesCount(conversation.id),
      (
        ChatMessage lastMessage,
        FirebaseUser userProfile,
        int unreadCount,
      ) =>
          ConversationItem(
        lastMessage: lastMessage,
        conversationPartner: userProfile,
        conversation: conversation,
        unreadMessagesCount: unreadCount,
      ),
    ).listen(
      onData,
      onError: onError,
    );
  }
}
