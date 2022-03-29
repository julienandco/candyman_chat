import 'package:neon_chat/src/conversation/conversation.dart';

abstract class ConversationRepository {
  Stream<List<ChatMessage>> getMessages(String conversationId);
  Stream<ChatMessage> getLastMessages(String conversationId);
  Stream<String> getDisplayName(String conversationId);
  Stream<String?> getThumbnail(String conversationId);

  void sendMessage(String conversationId, ChatMessage message);
  void hideMessage(String conversationId, ChatMessage message);
  void deleteMessage(String conversationId, ChatMessage message);

  void markAsSeen(String conversationId, ChatMessage message);
  ChatUploadFile sendFileMessage(String conversationId, ChatMessage message);
}
