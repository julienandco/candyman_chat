import 'package:neon_chat/src/conversations/conversations.dart';

abstract class ConversationsRepository {
  Stream<List<Conversation>> getAllConversations();
  Stream<Conversation> getConversation(String conversationId);

  Stream<int> getUnreadMessagesCount(String conversationId);
  Future<Conversation> createConversation(List<String> chatPersonId);
  void hideConversations(String conversationId);
}
