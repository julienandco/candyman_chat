import 'package:neon_chat/src/conversation/conversation.dart';

class MarkGroupMessageAsSeenUC {
  final ConversationRepository conversationRepository;

  const MarkGroupMessageAsSeenUC(this.conversationRepository);

  void call({
    required String conversationId,
    required ChatMessage message,
  }) {
    //TODOGROUPSEEN: cache the current time as timestamp or cache the timestamp
    // of last message read? latter is more accurate, but way more function calls
    // so way more cache writes

    //TODOGROUPSEEN: only call this every now and then (fb sync of your timestamp map)
    // return conversationRepository.markGroupMessageAsSeen(
    //     conversationId, message);
  }
}
