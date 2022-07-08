import 'package:neon_chat/src/conversation/conversation.dart';

abstract class ConversationRepository {
  Stream<List<ConversationMessage>> getMessages(String conversationId);
  Stream<ConversationMessage> getLastMessages(String conversationId);

  void sendMessage(String conversationId, ConversationMessage message);
  void hideMessage(String conversationId, ConversationMessage message);
  void deleteMessage(String conversationId, ConversationMessage message);

  void markAsSeen(String conversationId, ConversationMessage message);
  ConversationUploadFile sendFileMessage(
      String conversationId, ConversationMessage message);
}
