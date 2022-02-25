import 'package:neon_chat/src/conversation/conversation.dart';

abstract class UploadManagerRepository {
  Future<void> upload(ChatUploadFile file);
  Stream<ChatUploadFile> getFileStatus(String messageId);
}
