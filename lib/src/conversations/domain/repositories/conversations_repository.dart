import 'package:neon_chat/neon_chat.dart';

abstract class ConversationsRepository {
  Stream<List<Conversation>> getAllConversations();
  Stream<Conversation> getConversation(String conversationId);

  Stream<int> getUnreadMessagesCount(String conversationId);
  Stream<int> getUnreadGroupMessagesCount(String conversationId);
  Future<Conversation> createConversation({
    required FirebaseUser me,
    required FirebaseUser conversationPartner,
  });
  Future<Conversation> createGroupConversation({
    required Map<String, Map<String, String>> conversationPartners,
    required String displayName,
    String? thumbnail,
  });
  void hideConversations(String conversationId);
}
