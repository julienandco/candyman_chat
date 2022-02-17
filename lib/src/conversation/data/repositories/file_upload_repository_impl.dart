import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

import 'package:neon_chat/src/conversation/conversation.dart';
import 'package:neon_chat/src/core/core.dart';

class FileUploadRepositoryImpl implements FileUploadRepository {
  //TODO
  // final RemoteApiDataSource remoteApiDataSource;
  final Future<Either<Failure, String>> Function(String fileId) deleteEndpoint;
  final Future<Either<Failure, String>> Function(String fileId) getEndpoint;
  final Future<Either<Failure, String>> Function(
      String fileId, Map<String, dynamic> body) patchEndpoint;
  final Future<Either<Failure, String>> Function(
      String fileId, Map<String, dynamic> body) postEndpoint;

  final Future<Either<Failure, Success>> Function(
    String url, {
    String? filePath,
    PlatformFile? platformFile,
    void Function(int, int)? onReceiveProgress,
  }) uploadFileToPresignedURL;

  FileUploadRepositoryImpl(
    this.deleteEndpoint,
    this.patchEndpoint,
    this.postEndpoint,
    this.getEndpoint,
    this.uploadFileToPresignedURL,
  );
  // FileUploadRepositoryImpl(this.remoteApiDataSource);

  @override
  Future<Either<Failure, Success>> deleteFileWithId(String fileId) async {
    try {
      final response = await deleteEndpoint(fileId);
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
        final result = await uploadFileToPresignedURL(
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
          final response = await patchEndpoint('/profilepicture', {
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
        final result = await uploadFileToPresignedURL(
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
          final response = await postEndpoint('/messages', {
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
      final response = await getEndpoint('/getPresignedUrl/');
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
