import 'package:neon_chat/src/conversation/conversation.dart';

class MarkMessageAsSeenUC {
  final ConversationRepository conversationRepository;

  const MarkMessageAsSeenUC(this.conversationRepository);

  void call({
    required String conversationId,
    required ChatMessage message,
  }) {
    return conversationRepository.markAsSeen(conversationId, message);
  }
}
