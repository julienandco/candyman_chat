import 'package:neon_chat/neon_chat.dart';

abstract class ConversationsRepository {
  Stream<List<Conversation>> getAllConversations();
  Stream<Conversation> getConversation(String conversationId);

  Stream<int> getUnreadMessagesCount(String conversationId);
  Stream<int> getUnreadGroupMessagesCount(String conversationId);
  Future<Conversation> createConversation({
    required FirebaseUser me,
    required DirectConversationCreationData creationData,
  });
  Future<Conversation> createGroupConversation({
    required FirebaseUser me,
    required GroupConversationCreationData creationData,
  });
  void hideConversations(String conversationId);
}
