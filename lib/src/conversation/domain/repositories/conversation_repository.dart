import 'package:neon_chat/src/conversation/conversation.dart';

abstract class ConversationRepository {
  Stream<List<ChatMessage>> getMessages(String conversationId);
  Stream<ChatMessage> getLastMessages(String conversationId);

  void sendMessage(String conversationId, ChatMessage message);
  void hideMessage(String conversationId, ChatMessage message);
  void deleteMessage(String conversationId, ChatMessage message);

  void markAsSeen(String conversationId, ChatMessage message);
  ChatUploadFile sendFileMessage(String conversationId, ChatMessage message);

  //TODO: old
  // Stream<List<ChatMessageModel>> getMessages(String conversationId);
  // Stream<ChatMessageModel> getLastMessages(String conversationId);

  // void sendMessage(String conversationId, ChatMessageModel message);
  // void hideMessage(String conversationId, ChatMessageModel message);
  // void deleteMessage(String conversationId, ChatMessageModel message);

  // void markAsSeen(String conversationId, ChatMessageModel message);
  // ChatUploadFile sendFileMessage(
  //     String conversationId, ChatMessageModel message);
}
