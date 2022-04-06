// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ConversationMessage _$$_ConversationMessageFromJson(
        Map<String, dynamic> json) =>
    _$_ConversationMessage(
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
      type: const MyConversationMessageTypeConverter()
          .fromJson(json['type'] as String),
      doneUpload: json['doneUpload'] as bool? ?? false,
      filePath: json['filePath'] as String?,
      audioDuration: const MyAudioDurationConverter()
          .fromJson(json['audioDuration'] as int?),
      hiddenFrom: (json['hiddenFrom'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_ConversationMessageToJson(
        _$_ConversationMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'location': const MyLatLngConverter().toJson(instance.location),
      'seen': instance.seen,
      'senderId': instance.senderId,
      'timestamp': const MyDateTimeConverter().toJson(instance.timestamp),
      'upload': instance.upload,
      'type': const MyConversationMessageTypeConverter().toJson(instance.type),
      'doneUpload': instance.doneUpload,
      'filePath': instance.filePath,
      'audioDuration':
          const MyAudioDurationConverter().toJson(instance.audioDuration),
      'hiddenFrom': instance.hiddenFrom,
    };
