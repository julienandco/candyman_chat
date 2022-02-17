// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Upload _$$_UploadFromJson(Map<String, dynamic> json) => _$_Upload(
      fileId: json['fileId'] as String,
      thumbnailId: json['thumbnailId'] as String?,
      thumnailMimeType: json['thumnailMimeType'] as String?,
    );

Map<String, dynamic> _$$_UploadToJson(_$_Upload instance) => <String, dynamic>{
      'fileId': instance.fileId,
      'thumbnailId': instance.thumbnailId,
      'thumnailMimeType': instance.thumnailMimeType,
    };
