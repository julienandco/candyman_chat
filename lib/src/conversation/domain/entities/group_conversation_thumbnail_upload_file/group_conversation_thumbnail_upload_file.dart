import 'package:file_picker/file_picker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'group_conversation_thumbnail_upload_file.freezed.dart';

@freezed
class GroupConversationThumbnailUploadFile
    with _$GroupConversationThumbnailUploadFile {
  factory GroupConversationThumbnailUploadFile({
    required String groupConversationID,
    required String filePath,
    @Default(0) int uploadProgress,
    PlatformFile? platformFile,
  }) = _GroupConversationThumbnailUploadFile;
}
