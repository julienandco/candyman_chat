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

  ///
  /// A custom implementation of the group conversation creation. If this is
  /// non-null, then nothing will be added to firebase nor uploaded via the
  /// [NeonChatRemoteDataSource] by the package, everything you want to be
  /// done during group conversation creation has to be done by you.
  ///
  Future<Either<Failure, ConversationInfo>> Function(
      GroupConversationCreationData)? createGroupConversation;
}
