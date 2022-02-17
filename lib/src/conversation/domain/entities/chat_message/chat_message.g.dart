// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatMessage _$$_ChatMessageFromJson(Map<String, dynamic> json) =>
    _$_ChatMessage(
      id: json['id'] as String? ?? '',
      text: json['text'] as String?,
      location: const MyLatLngConverter()
          .fromJson(json['location'] as Map<String, num>),
      seen: json['seen'] as bool? ?? false,
      senderId: json['senderId'] as String,
      receiverId: json['receiverId'] as String,
      timestamp: json['timestamp'] == null
          ? null
          : DateTime.parse(json['timestamp'] as String),
      upload: json['upload'] == null
          ? null
          : Upload.fromJson(json['upload'] as Map<String, dynamic>),
      type: $enumDecode(_$ChatMessageTypeEnumMap, json['type']),
      doneUpload: json['doneUpload'] as bool? ?? false,
      filePath: json['filePath'] as String?,
      audioDuration: json['audioDuration'] == null
          ? null
          : Duration(microseconds: json['audioDuration'] as int),
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
      'receiverId': instance.receiverId,
      'timestamp': instance.timestamp?.toIso8601String(),
      'upload': instance.upload,
      'type': _$ChatMessageTypeEnumMap[instance.type],
      'doneUpload': instance.doneUpload,
      'filePath': instance.filePath,
      'audioDuration': instance.audioDuration?.inMicroseconds,
      'hiddenFrom': instance.hiddenFrom,
    };

const _$ChatMessageTypeEnumMap = {
  ChatMessageType.text: 'text',
  ChatMessageType.voice: 'voice',
  ChatMessageType.image: 'image',
  ChatMessageType.video: 'video',
  ChatMessageType.file: 'file',
  ChatMessageType.deleted: 'deleted',
};
