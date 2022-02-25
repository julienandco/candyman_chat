import 'package:neon_chat/src/conversations/conversations.dart';

class HideConversationUC {
  final ConversationsRepository conversationsRepository;

  const HideConversationUC(this.conversationsRepository);

  void call(String conversationId) {
    conversationsRepository.hideConversations(conversationId);
  }
}
