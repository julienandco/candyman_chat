import 'package:neon_chat/src/conversations/conversations.dart';
import 'package:neon_chat/src/core/core.dart';

class CreateConversationUC {
  final ConversationsRepository conversationsRepository;

  CreateConversationUC(this.conversationsRepository);

  Future<Conversation> call({
    required FirebaseUser me,
    required FirebaseUser conversationPartner,
  }) async {
    return await conversationsRepository.createConversation(
        me: me, conversationPartner: conversationPartner);
  }
}
