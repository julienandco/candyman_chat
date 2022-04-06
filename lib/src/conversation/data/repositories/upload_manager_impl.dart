import 'package:injectable/injectable.dart';
import 'package:neon_chat/src/conversation/conversation.dart';

@LazySingleton(as: UploadManagerRepository)
class UploadManagerRepositoryImpl implements UploadManagerRepository {
  final FileUploadRepository fileUploadRepository;

  UploadManagerRepositoryImpl({
    required this.fileUploadRepository,
  });

  final List<ConversationUploadFile> _fileQueue = [];

  @override
  Future<void> upload(ConversationUploadFile file) async {
    _fileQueue.add(file);
    final fileIndex = _getFileIndexFromQueue(file.messageId);

    try {
      await fileUploadRepository.uploadFileToMessage(
        file: file,
        conversationId: file.conversationID,
        messageId: file.messageId,
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
