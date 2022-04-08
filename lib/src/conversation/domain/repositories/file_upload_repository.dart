import 'package:dartz/dartz.dart';

import 'package:neon_chat/src/conversation/conversation.dart';
import 'package:neon_chat/src/core/core.dart';

abstract class FileUploadRepository {
  Future<Either<Failure, Success>> deleteFileWithId(String fileId);
  Future<void> uploadFileToMessage({
    required ConversationUploadFile file,
    required String conversationId,
    required String messageId,
  });
  Future<String?> getUploadUrl(String id);
}
