import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload.freezed.dart';
part 'upload.g.dart';

@freezed
class Upload with _$Upload {
  factory Upload({
    required String fileId,
    String? thumbnailId,
    String? thumnailMimeType,
  }) = _Upload;

  factory Upload.fromJson(Map<String, dynamic> json) => _$UploadFromJson(json);
}
