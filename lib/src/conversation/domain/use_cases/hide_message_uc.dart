import 'package:neon_chat/src/conversation/conversation.dart';

class HideMessageUC {
  final ConversationRepository conversationRepository;

  const HideMessageUC(this.conversationRepository);

  void call({
    required String conversationId,
    required ChatMessage message,
  }) {
    return conversationRepository.hideMessage(conversationId, message);
  }
}
