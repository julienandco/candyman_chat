import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:neon_chat/src/conversation/conversation.dart';

class SendPlatformFileMessageUC {
  final ConversationRepository conversationRepository;
  final UploadManagerRepository uploadManagerRepository;

  const SendPlatformFileMessageUC({
    required this.conversationRepository,
    required this.uploadManagerRepository,
  });

  void call({
    required String conversationId,
    required String senderId,
    required PlatformFile file,
  }) {
    ConversationMessageType type;
    switch (file.extension) {
      case 'png':
      case 'gif':
      case 'bmp':
      case 'jpeg':
      case 'jpg':
        type = ConversationMessageType.image;
        break;
      case 'mov':
      case 'mp4':
        type = ConversationMessageType.video;
        break;

      default:
        type = ConversationMessageType.file;
    }

    final message = ConversationMessage(
      senderId: senderId,
      type: type,
      filePath: !kIsWeb ? file.path : '',
      text: file.name,
    );

    final uploadFile =
        conversationRepository.sendFileMessage(conversationId, message);

    uploadManagerRepository.upload(uploadFile.copyWith(platformFile: file));
  }
}
