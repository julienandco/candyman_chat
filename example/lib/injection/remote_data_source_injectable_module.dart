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
  Future<Either<Failure, String>> deleteFile(String fileId) async {
    return right('TODO');
  }

  @override
  Future<Either<Failure, String>> getEndpoint(String fileId) async {
    return right('TODO');
  }

  @override
  String get remoteUploadsURL => 'TODO';

  @override
  Future<Either<Failure, String>> uploadFileToConversation(
      {required ConversationUploadFile fileToUpload,
      ConversationMessageType? typeToUpload,
      void Function(int p1, int p2)? onUploadProgress}) async {
    return right('TODO');
  }

  @override
  Future<Either<Failure, String>> uploadGroupConversationThumbnail(
      {required GroupConversationThumbnailUploadFile thumbnail,
      void Function(int p1, int p2)? onUploadProgress}) async {
    return right('TODO');
  }
}
