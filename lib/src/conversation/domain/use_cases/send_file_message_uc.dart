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
    required String receiverId,
    required ChatMessageType type,
    required String filePath,
    Duration? duration,
    bool reparseFilePath = false,
  }) {
    //TODO: what do we do in that case?
    assert(type != ChatMessageType.voice || duration != null);
    final message = ChatMessage(
      senderId: senderId,
      receiverId: receiverId,
      type: type,
      filePath: filePath,
      audioDuration: duration,
    );
    final uploadFile =
        conversationRepository.sendFileMessage(conversationId, message);
    if (reparseFilePath) {
      final newFilePath = Uri.parse(filePath).path;
      uploadManagerRepository
          .upload(uploadFile.copyWith(filePath: newFilePath));
    } else {
      uploadManagerRepository.upload(uploadFile);
    }
  }
}
