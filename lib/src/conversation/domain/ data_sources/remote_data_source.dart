import 'package:dartz/dartz.dart';
import 'package:neon_chat/neon_chat.dart';

abstract class NeonChatRemoteDataSource {
  String get remoteUploadsURL;
  Future<Either<Failure, String>> deleteEndpoint(String fileId);
  Future<Either<Failure, String>> getEndpoint(String fileId);

  Future<Either<Failure, String>> uploadEndpoint({
    required ConversationUploadFile fileToUpload,
    required String conversationId,
    required String messageId,
  });
}
