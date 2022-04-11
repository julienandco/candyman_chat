import 'dart:developer';

import 'package:dartz/dartz.dart';

import 'package:neon_chat/src/conversation/conversation.dart';
import 'package:neon_chat/src/core/core.dart';

class FileUploadRepositoryImpl implements FileUploadRepository {
  final NeonChatRemoteDataSource remoteDataSource;

  FileUploadRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, Success>> deleteFileWithId(String fileId) async {
    try {
      final response = await remoteDataSource.deleteEndpoint(fileId);

      return response.fold((l) => left(l), (r) => right(const Success()));
    } catch (e) {
      return left(const Failure());
    }
  }

  @override
  Future<void> uploadFileToMessage({
    required ConversationUploadFile file,
    ConversationMessageType? typeOfFile,
    Function(int, int)? onUploadProgress,
  }) async {
    try {
      final response = await remoteDataSource.uploadEndpoint(
        fileToUpload: file,
        typeToUpload: typeOfFile,
        onUploadProgress: onUploadProgress,
      );

      if (response.isRight()) {
        log("========UPLOAD FILE TO MESSAGE=========", name: '$runtimeType');
        log('$response', name: '$runtimeType');
        log("============================", name: '$runtimeType');
      } else {
        log("========ERROR WHILE TRYING TO UPLOAD FILE TO MESSAGE=========",
            name: '$runtimeType');
        log('$response', name: '$runtimeType');
        log("============================", name: '$runtimeType');
      }
    } catch (e) {
      log('ERROR: uploadFileToMessage - $e', name: '$runtimeType');
    }
  }

  @override
  Future<String?> getUploadUrl(String id) async {
    final baseUploadsUrl = remoteDataSource.remoteUploadsURL;
    return '$baseUploadsUrl/$id';
  }
}
