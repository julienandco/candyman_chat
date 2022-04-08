import 'package:neon_chat/src/conversation/conversation.dart';

class SendFileMessageUC {
  final ConversationRepository conversationRepository;
  final UploadManagerRepository uploadManagerRepository;

  const SendFileMessageUC({
    required this.conversationRepository,
    required this.uploadManagerRepository,
  });

  void call({
    required String conversationId,
    required String senderId,
    required ConversationMessageType type,
    required String filePath,
    Duration? duration,
    bool reparseFilePath = false,
  }) {
    //TODO: what do we do in that case?
    assert(type != ConversationMessageType.voice || duration != null);
    final message = ConversationMessage(
      senderId: senderId,
      type: type,
      filePath: filePath,
      audioDuration: duration,
    );
    final uploadFile =
        conversationRepository.sendFileMessage(conversationId, message);
    if (reparseFilePath) {
      final newFilePath = Uri.parse(filePath).path;
      uploadManagerRepository.upload(
        file: uploadFile.copyWith(filePath: newFilePath),
        typeOfFile: type,
      );
    } else {
      uploadManagerRepository.upload(
        file: uploadFile,
        typeOfFile: type,
      );
    }
  }
}
