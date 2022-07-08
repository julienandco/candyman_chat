import 'package:neon_chat/src/conversations/conversations.dart';
import 'package:neon_chat/src/core/core.dart';

class CreateGroupConversationUC {
  final ConversationsRepository conversationsRepository;

  CreateGroupConversationUC(this.conversationsRepository);

  Future<GroupConversation> call({
    required FirebaseUser me,
    required GroupConversationCreationData creationData,
  }) async {
    return await conversationsRepository.createGroupConversation(
      me: me,
      creationData: creationData,
    );
  }
}
