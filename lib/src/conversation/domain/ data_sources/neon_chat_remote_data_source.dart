import 'package:dartz/dartz.dart';
import 'package:neon_chat/neon_chat.dart';

abstract class NeonChatRemoteDataSource {
  String get remoteUploadsURL;
  Future<Either<Failure, String>> deleteFile(String fileId);
  Future<Either<Failure, String>> getEndpoint(String fileId);

  Future<Either<Failure, String>> uploadFileToConversation({
    required ConversationUploadFile fileToUpload,
    ConversationMessageType? typeToUpload,
    void Function(int, int)? onUploadProgress,
  });

  Future<Either<Failure, String>> uploadGroupConversationThumbnail({
    required GroupConversationThumbnailUploadFile thumbnail,
    void Function(int, int)? onUploadProgress,
  });
}
