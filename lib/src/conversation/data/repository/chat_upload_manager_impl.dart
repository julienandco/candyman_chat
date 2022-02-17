//TODO

// import 'package:injectable/injectable.dart';
// import 'package:papeo_app/core/data/data_sources/remote_api_data_source.dart';
// import 'package:papeo_app/core/domain/repositories/file_upload_repository.dart';

// import 'package:papeo_app/features/chat/domain/entities/chat_upload_file.dart';
// import 'package:papeo_app/features/chat/domain/repository/chat_upload_repository.dart';

// @LazySingleton(as: ChatUploadManagerRepository)
// class ChatUploadManagerRepositoryImpl implements ChatUploadManagerRepository {
//   final RemoteApiDataSource remoteApiDataSource;
//   final FileUploadRepository fileUploadRepository;

//   ChatUploadManagerRepositoryImpl({
//     required this.remoteApiDataSource,
//     required this.fileUploadRepository,
//   });

//   final List<ChatUploadFile> _fileQueue = [];

//   @override
//   Future<void> upload(ChatUploadFile file) async {
//     _fileQueue.add(file);
//     final fileIndex = _getFileIndexFromQueue(file.messageId);

//     try {
//       // await remoteApiDataSource.uploadFiles(
//       //   '$kRemoteUploadsUrl?type=message&conversation=${file.conversationID}&message=${file.messageId}',
//       //   [file.filePath],
//       // );
//       await fileUploadRepository.uploadFileToMessage(
//         file: file,
//         conversationId: file.conversationID,
//         messageId: file.messageId,
//       );

//       _fileQueue[fileIndex] = _fileQueue[fileIndex].copyWith(
//         status: ChatUploadFileStatus.done,
//       );
//     } catch (err) {
//       _fileQueue[fileIndex] =
//           _fileQueue[fileIndex].copyWith(status: ChatUploadFileStatus.faild);
//     }
//   }

//   int _getFileIndexFromQueue(String messageId) {
//     return _fileQueue.indexWhere((element) => element.messageId == messageId);
//   }

//   @override
//   Stream<ChatUploadFile> getFileStatus(String messageId) {
//     return Stream.fromIterable(_fileQueue).where(
//       (event) => event.messageId == messageId,
//     );
//   }
// }
