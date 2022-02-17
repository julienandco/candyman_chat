import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:file_picker/file_picker.dart';

part 'chat_upload_file.freezed.dart';

enum ChatUploadFileStatus { none, done, uploading, failed }

@freezed
class ChatUploadFile with _$ChatUploadFile {
  factory ChatUploadFile({
    required String messageId,
    required String conversationID,
    required String filePath,
    required ChatUploadFileStatus status,
    @Default(0) int uploadProgress,
    PlatformFile? platformFile,
  }) = _ChatUploadFile;
}

//TODO: old
// class ChatUploadFile {
//   final String messageId;
//   final String conversationID;
//   final String filePath;
//   final ChatUploadFileStatus status;
//   final int uploadProgress;
//   final PlatformFile? platformFile;

//   ChatUploadFile({
//     required this.messageId,
//     required this.conversationID,
//     required this.filePath,
//     required this.status,
//     this.uploadProgress = 0,
//     this.platformFile,
//   });

//   ChatUploadFile copyWith({
//     String? messageId,
//     String? conversationID,
//     String? filePath,
//     ChatUploadFileStatus? status,
//     int? uploadProgress,
//     PlatformFile? platformFile,
//   }) {
//     return ChatUploadFile(
//       messageId: messageId ?? this.messageId,
//       conversationID: conversationID ?? this.conversationID,
//       filePath: filePath ?? this.filePath,
//       status: status ?? this.status,
//       uploadProgress: uploadProgress ?? this.uploadProgress,
//       platformFile: platformFile ?? this.platformFile,
//     );
//   }
// }
