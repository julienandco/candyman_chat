//TODO

import 'package:neon_chat/src/conversation/conversation.dart';

// @LazySingleton(as: ChatUploadManagerRepository)
class ChatUploadManagerRepositoryImpl implements ChatUploadManagerRepository {
  final FileUploadRepository fileUploadRepository;

  ChatUploadManagerRepositoryImpl({
    required this.fileUploadRepository,
  });

  final List<ChatUploadFile> _fileQueue = [];

  @override
  Future<void> upload(ChatUploadFile file) async {
    _fileQueue.add(file);
    final fileIndex = _getFileIndexFromQueue(file.messageId);

    try {
      // await remoteApiDataSource.uploadFiles(
      //   '$kRemoteUploadsUrl?type=message&conversation=${file.conversationID}&message=${file.messageId}',
      //   [file.filePath],
      // );
      await fileUploadRepository.uploadFileToMessage(
        file: file,
        conversationId: file.conversationID,
        messageId: file.messageId,
      );

      _fileQueue[fileIndex] = _fileQueue[fileIndex].copyWith(
        status: ChatUploadFileStatus.done,
      );
    } catch (err) {
      _fileQueue[fileIndex] =
          _fileQueue[fileIndex].copyWith(status: ChatUploadFileStatus.failed);
    }
  }

  int _getFileIndexFromQueue(String messageId) {
    return _fileQueue.indexWhere((element) => element.messageId == messageId);
  }

  @override
  Stream<ChatUploadFile> getFileStatus(String messageId) {
    return Stream.fromIterable(_fileQueue).where(
      (event) => event.messageId == messageId,
    );
  }
}
