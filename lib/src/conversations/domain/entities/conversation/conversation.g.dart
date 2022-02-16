// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Conversation _$$_ConversationFromJson(Map<String, dynamic> json) =>
    _$_Conversation(
      id: json['id'] as String,
      displayName: json['displayName'] as String?,
      conversationMembers: (json['conversationMembers'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      thumbnail: json['thumbnail'] as String?,
      timestamp: json['timestamp'] == null
          ? null
          : DateTime.parse(json['timestamp'] as String),
      hiddenFrom: (json['hiddenFrom'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_ConversationToJson(_$_Conversation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'displayName': instance.displayName,
      'conversationMembers': instance.conversationMembers,
      'thumbnail': instance.thumbnail,
      'timestamp': instance.timestamp?.toIso8601String(),
      'hiddenFrom': instance.hiddenFrom,
    };
