// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Upload _$$_UploadFromJson(Map<String, dynamic> json) => _$_Upload(
      fileId: json['original'] as String,
      thumbnailId: json['thumbnail'] as String?,
      thumnailMimeType: json['thumnailMimeType'] as String?,
    );

Map<String, dynamic> _$$_UploadToJson(_$_Upload instance) => <String, dynamic>{
      'original': instance.fileId,
      'thumbnail': instance.thumbnailId,
      'thumnailMimeType': instance.thumnailMimeType,
    };
