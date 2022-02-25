import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:injectable/injectable.dart';
import 'dart:io';

import 'package:neon_chat/src/conversation/conversation.dart';
import 'package:neon_chat/src/core/core.dart';

@LazySingleton(as: FileUploadRepository)
class FileUploadRepositoryImpl implements FileUploadRepository {
  final RemoteDataSource remoteDataSource;

  FileUploadRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, Success>> deleteFileWithId(String fileId) async {
    try {
      final response = await remoteDataSource.deleteEndpoint(fileId);
      // final response = await remoteApiDataSource
      //     .deleteApiEndpoint('$kRemoteUploadsUrl/$fileId');
      return response.fold((l) => left(l), (r) => right(const Success()));
    } catch (e) {
      return left(const Failure());
    }
  }

  @override
  Future<void> updateUserProfilePhoto(
      {File? photoFile, PlatformFile? platformFile}) async {
    try {
      final newPresignedUrl = await getNewPresignedUrl();
      if (newPresignedUrl?.value1 != null) {
        final result = await remoteDataSource.uploadFileToPresignedURL(
          newPresignedUrl!.value1!,
          filePath: photoFile?.path,
          platformFile: platformFile,
        );
        // final result = await remoteApiDataSource.uploadFileToPresignedUrl(
        //   newPresignedUrl!.value1!,
        //   filePath: photoFile?.path,
        //   platformFile: platformFile,
        // );
        if (result.isRight() && newPresignedUrl.value2 != null) {
          final response =
              await remoteDataSource.patchEndpoint('/profilepicture', {
            'upload': newPresignedUrl.value2,
          });
          // final response = await remoteApiDataSource
          //     .patchApiEndpoint('$kRemoteUploadsUrl/profilepicture', {
          //   'upload': newPresignedUrl.value2,
          // });
          log("========UPDATE PROFILE PIC=========", name: '$runtimeType');
          log('$response', name: '$runtimeType');
          log("============================", name: '$runtimeType');
        }
      }
      return;
    } catch (e) {
      log('ERROR: updateUserProfilePhoto $e', name: '$runtimeType');
    }
  }

  @override
  Future<void> uploadFileToMessage(
      {required ChatUploadFile file,
      required String conversationId,
      required String messageId}) async {
    try {
      final newPresignedUrl = await getNewPresignedUrl();
      if (newPresignedUrl?.value1 != null) {
        final result = await remoteDataSource.uploadFileToPresignedURL(
          newPresignedUrl!.value1!,
          filePath: file.filePath,
          platformFile: file.platformFile,
        );
        // final result = await remoteApiDataSource.uploadFileToPresignedUrl(
        //   newPresignedUrl!.value1!,
        //   filePath: file.filePath,
        //   platformFile: file.platformFile,
        // );
        if (result.isRight() && newPresignedUrl.value2 != null) {
          final response = await remoteDataSource.postEndpoint('/messages', {
            'upload': newPresignedUrl.value2,
            'conversation': conversationId,
            'message': messageId,
          });
          // final response = await remoteApiDataSource
          //     .postApiEndpoint('$kRemoteUploadsUrl/messages', {
          //   'upload': newPresignedUrl.value2,
          //   'conversation': conversationId,
          //   'message': messageId,
          // });
          log("========UPLAOD FILE TO MESSAGE=========", name: '$runtimeType');
          log('$response', name: '$runtimeType');
          log("============================", name: '$runtimeType');
        }
      }
    } catch (e) {
      log('ERROR: uploadFileToMessage - $e', name: '$runtimeType');
    }
  }

  @override
  Future<Tuple2<String?, String?>?> getNewPresignedUrl() async {
    try {
      final response = await remoteDataSource.getEndpoint('/getPresignedUrl/');
      // final response = await remoteApiDataSource
      //     .getApiEndpoint('$kRemoteUploadsUrl/getPresignedUrl/');
      log("========PRESIGNED URL=========", name: '$runtimeType');
      log('$response', name: '$runtimeType');
      log("============================", name: '$runtimeType');
      return response.fold(
        (l) => null,
        (r) {
          final map = json.decode(r) as Map<String, dynamic>;
          return Tuple2(map['url'] as String?, map['_id'] as String?);
        },
      );
    } catch (e) {
      log('ERROR: _getNewPresignedUrl $e', name: '$runtimeType');
      return null;
    }
  }
}
