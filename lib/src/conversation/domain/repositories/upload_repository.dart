import 'package:neon_chat/src/conversation/conversation.dart';

abstract class UploadManagerRepository {
  Future<void> upload(ConversationUploadFile file);
  Stream<ConversationUploadFile> getFileStatus(String messageId);
}
