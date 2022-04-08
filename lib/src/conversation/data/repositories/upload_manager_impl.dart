import 'package:neon_chat/src/conversation/conversation.dart';

class UploadManagerRepositoryImpl implements UploadManagerRepository {
  final FileUploadRepository fileUploadRepository;

  UploadManagerRepositoryImpl({
    required this.fileUploadRepository,
  });

  final List<ConversationUploadFile> _fileQueue = [];

  @override
  Future<void> upload({
    required ConversationUploadFile file,
    required ConversationMessageType typeOfFile,
  }) async {
    _fileQueue.add(file);
    final fileIndex = _getFileIndexFromQueue(file.messageId);

    try {
      await fileUploadRepository.uploadFileToMessage(
        file: file,
        typeOfFile: typeOfFile,
      );

      _fileQueue[fileIndex] = _fileQueue[fileIndex].copyWith(
        status: ConversationUploadFileStatus.done,
      );
    } catch (err) {
      _fileQueue[fileIndex] = _fileQueue[fileIndex]
          .copyWith(status: ConversationUploadFileStatus.failed);
    }
  }

  int _getFileIndexFromQueue(String messageId) {
    return _fileQueue.indexWhere((element) => element.messageId == messageId);
  }

  @override
  Stream<ConversationUploadFile> getFileStatus(String messageId) {
    return Stream.fromIterable(_fileQueue).where(
      (event) => event.messageId == messageId,
    );
  }
}
