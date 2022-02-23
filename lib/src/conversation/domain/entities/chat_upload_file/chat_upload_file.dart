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
