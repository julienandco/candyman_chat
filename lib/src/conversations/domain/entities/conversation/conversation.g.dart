// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Conversation _$$_ConversationFromJson(Map<String, dynamic> json) =>
    _$_Conversation(
      id: json['id'] as String,
      groupName: json['groupName'] as String?,
      conversationMembers:
          (json['conversationMembers'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, Map<String, String?>.from(e as Map)),
      ),
      thumbnail: json['thumbnail'] as String?,
      createdAt: const MyDateTimeConverter().fromJson(json['createdAt']),
      hiddenFrom: (json['hiddenFrom'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_ConversationToJson(_$_Conversation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'groupName': instance.groupName,
      'conversationMembers': instance.conversationMembers,
      'thumbnail': instance.thumbnail,
      'createdAt': const MyDateTimeConverter().toJson(instance.createdAt),
      'hiddenFrom': instance.hiddenFrom,
    };
