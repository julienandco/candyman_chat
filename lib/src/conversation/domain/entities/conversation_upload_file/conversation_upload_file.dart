import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:file_picker/file_picker.dart';

part 'conversation_upload_file.freezed.dart';

enum ConversationUploadFileStatus { none, done, uploading, failed }

@freezed
class ConversationUploadFile with _$ConversationUploadFile {
  factory ConversationUploadFile({
    required String messageId,
    required String conversationID,
    required String filePath,
    required ConversationUploadFileStatus status,
    @Default(0) int uploadProgress,
    PlatformFile? platformFile,
  }) = _ConversationUploadFile;
}
