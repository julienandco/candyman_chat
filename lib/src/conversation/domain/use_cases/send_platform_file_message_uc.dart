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
    ChatMessageType type;
    switch (file.extension) {
      case 'png':
      case 'gif':
      case 'bmp':
      case 'jpeg':
      case 'jpg':
        type = ChatMessageType.image;
        break;
      case 'mov':
      case 'mp4':
        type = ChatMessageType.video;
        break;

      default:
        type = ChatMessageType.file;
    }

    final message = ChatMessage(
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
