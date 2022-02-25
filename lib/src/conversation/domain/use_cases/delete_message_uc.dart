import 'package:neon_chat/src/conversation/conversation.dart';

class DeleteMessageUC {
  final ConversationRepository conversationRepository;

  const DeleteMessageUC(this.conversationRepository);

  void call({
    required String conversationId,
    required ChatMessage message,
  }) {
    return conversationRepository.deleteMessage(conversationId, message);
  }
}
