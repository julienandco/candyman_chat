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
    // if (conversation.conversationMembers.length > 2) {
    //   //is groupChat
    //   return CombineLatestStream.combine4(
    //     conversationRepository.getLastMessages(conversation.id),
    //     conversationRepository.getDisplayName(conversation.id),
    //     conversationRepository.getThumbnail(conversation.id),
    //     conversationsRepository.getUnreadMessagesCount(conversation.id),
    //     (
    //       ChatMessage lastMessage,
    //       String displayName,
    //       String? thumbnail,
    //       int unreadCount,
    //     ) =>
    //         ConversationItem.groupConversation(
    //       lastMessage: lastMessage,
    //       displayName: displayName,
    //       thumbnail: thumbnail,
    //       conversation: conversation,
    //       unreadMessagesCount: unreadCount,
    //     ),
    //   ).listen(
    //     onData,
    //     onError: onError,
    //   );
    // } else {
    return CombineLatestStream.combine2(
      conversationRepository.getLastMessages(conversation.id),
      // userProfileRepository.getUserProfile(otherUserId),
      conversationsRepository.getUnreadMessagesCount(conversation.id),
      (
        ChatMessage lastMessage,
        // FirebaseUser userProfile,
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
