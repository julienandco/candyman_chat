import 'package:dartz/dartz.dart';
import 'package:neon_chat/src/conversations/conversations.dart';
import 'package:neon_chat/src/core/core.dart';

class CreateDirectConversationUC {
  final ConversationsRepository conversationsRepository;

  CreateDirectConversationUC(this.conversationsRepository);

  Future<Either<Failure, DirectConversation>> call({
    required FirebaseUser me,
    required DirectConversationCreationData creationData,
  }) async {
    return await conversationsRepository.createDirectConversation(
      me: me,
      creationData: creationData,
    );
  }
}
