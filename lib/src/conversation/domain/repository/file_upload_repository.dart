import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';

//TODO: imports
import 'package:neon_chat/src/core/domain/entities/request_responses.dart';
import 'package:neon_chat/src/conversation/domain/entities/chat_upload_file/chat_upload_file.dart';

abstract class FileUploadRepository {
  Future<void> updateUserProfilePhoto(
      {File? photoFile, PlatformFile? platformFile});

  Future<Either<Failure, Success>> deleteFileWithId(String fileId);
  Future<void> uploadFileToMessage({
    required ChatUploadFile file,
    required String conversationId,
    required String messageId,
  });
  Future<Tuple2<String?, String?>?> getNewPresignedUrl();
}
