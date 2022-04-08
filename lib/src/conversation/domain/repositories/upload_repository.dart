import 'package:neon_chat/src/conversation/conversation.dart';

abstract class UploadManagerRepository {
  Future<void> upload(
      {required ConversationUploadFile file,
      required ConversationMessageType typeOfFile});
  Stream<ConversationUploadFile> getFileStatus(String messageId);
}
