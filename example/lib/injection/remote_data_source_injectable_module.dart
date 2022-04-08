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
  // TODO: implement remoteUploadsURL
  String get remoteUploadsURL => throw UnimplementedError();

  @override
  Future<Either<Failure, String>> uploadEndpoint(
      {required ConversationUploadFile fileToUpload,
      required String conversationId,
      required String messageId}) {
    // TODO: implement uploadEndpoint
    throw UnimplementedError();
  }
}
