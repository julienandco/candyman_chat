import 'package:neon_chat/src/conversation/conversation.dart';

class SendTextMessageUC {
  final ConversationRepository conversationRepository;

  const SendTextMessageUC(this.conversationRepository);

  void call({
    required String conversationId,
    required ConversationMessage message,
  }) {
    conversationRepository.sendMessage(conversationId, message);
  }
}
