import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:neon_chat/neon_chat.dart';

@module
abstract class RemoteDataBaseInjectableModule {
  @lazySingleton
  NeonChatRemoteDataSource get remoteDataSource => _MyDataSource();
}

class _MyDataSource implements NeonChatRemoteDataSource {
  @override
  Future<Either<Failure, String>> deleteEndpoint(String fileId) async {
    // TODO: implement deleteEndpoint

    return right('TODO');
  }

  @override
  Future<Either<Failure, String>> getEndpoint(String fileId) async {
    // TODO: implement getEndpoint
    return right('TODO');
  }

  @override
  Future<Either<Failure, String>> patchEndpoint(
      String fileId, Map<String, dynamic> body) async {
    // TODO: implement patchEndpoint
    return right('TODO');
  }

  @override
  Future<Either<Failure, String>> postEndpoint(
      String fileId, Map<String, dynamic> body) async {
    // TODO: implement postEndpoint
    return right('TODO');
  }

  @override
  Future<Either<Failure, Success>> uploadFileToPresignedURL(String url,
      {String? filePath,
      PlatformFile? platformFile,
      void Function(int p1, int p2)? onReceiveProgress}) async {
    // TODO: implement uploadFileToPresignedURL
    return right(const Success());
  }

  @override
  Future<Either<Failure, String>> getUploadUrl(String id) async {
    // TODO: implement getUploadUrl
    return right('null');
  }
}
