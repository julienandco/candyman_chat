import 'package:neon_chat/src/conversations/conversations.dart';

abstract class ConversationsRepository {
  Stream<List<Conversation>> getAllConversations();
  Stream<Conversation> getConversation(String conversationId);

  Stream<int> getUnreadMessagesCount(String conversationId);
  Stream<int> getUnreadGroupMessagesCount(String conversationId);
  Future<Conversation> createConversation({
    required String conversationPartnerID,
    required String conversationPartnerUserName,
    String? conversationPartnerProfilePictureURL,
  });
  Future<Conversation> createGroupConversation({
    required Map<String, Map<String, String>> conversationPartners,
    required String displayName,
    String? thumbnail,
  });
  void hideConversations(String conversationId);
}
