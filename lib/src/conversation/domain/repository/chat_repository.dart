//TODO: imports
import 'package:neon_chat/src/conversation/domain/entities/chat_message/chat_message.dart';
import 'package:neon_chat/src/conversation/domain/entities/chat_upload_file/chat_upload_file.dart';

abstract class ChatRepository {
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
