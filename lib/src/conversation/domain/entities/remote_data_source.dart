import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';

import 'package:neon_chat/src/core/core.dart';

abstract class RemoteDataSource {
  Future<Either<Failure, String>> deleteEndpoint(String fileId);
  Future<Either<Failure, String>> getEndpoint(String fileId);
  Future<Either<Failure, String>> patchEndpoint(
      String fileId, Map<String, dynamic> body);
  Future<Either<Failure, String>> postEndpoint(
      String fileId, Map<String, dynamic> body);
  Future<Either<Failure, Success>> uploadFileToPresignedURL(
    String url, {
    String? filePath,
    PlatformFile? platformFile,
    void Function(int, int)? onReceiveProgress,
  });
}
