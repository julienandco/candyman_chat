// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatMessage _$$_ChatMessageFromJson(Map<String, dynamic> json) =>
    _$_ChatMessage(
      id: json['id'] as String? ?? '',
      text: json['text'] as String?,
      location:
          const MyLatLngConverter().fromJson(json['location'] as GeoPoint?),
      seen: json['seen'] as bool? ?? false,
      senderId: json['senderId'] as String,
      timestamp: const MyDateTimeConverter().fromJson(json['timestamp']),
      upload: json['upload'] == null
          ? null
          : Upload.fromJson(json['upload'] as Map<String, dynamic>),
      type: const MyChatMessageTypeConverter().fromJson(json['type'] as String),
      doneUpload: json['doneUpload'] as bool? ?? false,
      filePath: json['filePath'] as String?,
      audioDuration: const MyAudioDurationConverter()
          .fromJson(json['audioDuration'] as int?),
      hiddenFrom: (json['hiddenFrom'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_ChatMessageToJson(_$_ChatMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'location': const MyLatLngConverter().toJson(instance.location),
      'seen': instance.seen,
      'senderId': instance.senderId,
      'timestamp': const MyDateTimeConverter().toJson(instance.timestamp),
      'upload': instance.upload,
      'type': const MyChatMessageTypeConverter().toJson(instance.type),
      'doneUpload': instance.doneUpload,
      'filePath': instance.filePath,
      'audioDuration':
          const MyAudioDurationConverter().toJson(instance.audioDuration),
      'hiddenFrom': instance.hiddenFrom,
    };
