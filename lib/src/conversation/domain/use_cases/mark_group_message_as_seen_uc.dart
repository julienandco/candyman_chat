import 'package:neon_chat/src/conversation/conversation.dart';

class MarkGroupMessageAsSeenUC {
  final ConversationRepository conversationRepository;

  const MarkGroupMessageAsSeenUC(this.conversationRepository);

  void call({
    required String conversationId,
    required ChatMessage message,
  }) {
    return conversationRepository.markGroupMessageAsSeen(
        conversationId, message);
  }
}
