//TODO: import

import 'package:neon_chat/src/conversation/domain/entities/chat_upload_file/chat_upload_file.dart';

abstract class ChatUploadManagerRepository {
  Future<void> upload(ChatUploadFile file);
  Stream<ChatUploadFile> getFileStatus(String messageId);
}
