import 'package:dartz/dartz.dart';
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
  // TODO: implement remoteUploadsURL
  String get remoteUploadsURL => 'test';

  @override
  Future<Either<Failure, String>> uploadEndpoint(
      {required ConversationUploadFile fileToUpload,
      ConversationMessageType? typeToUpload,
      void Function(int p1, int p2)? onUploadProgress}) {
    // TODO: implement uploadEndpoint
    throw UnimplementedError();
  }
}
