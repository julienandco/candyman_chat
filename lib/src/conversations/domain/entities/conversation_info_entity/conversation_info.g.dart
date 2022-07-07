// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ConversationInfo _$$_ConversationInfoFromJson(Map<String, dynamic> json) =>
    _$_ConversationInfo(
      id: json['id'] as String,
      isGroupConversation: json['isGroupConversation'] as bool,
      conversationMembers: (json['conversationMembers'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      groupName: json['groupName'] as String?,
      groupPicture: json['groupPicture'] as String?,
      createdAt:
          const MyNonNullableDateTimeConverter().fromJson(json['createdAt']),
      hiddenFrom: (json['hiddenFrom'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_ConversationInfoToJson(_$_ConversationInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isGroupConversation': instance.isGroupConversation,
      'conversationMembers': instance.conversationMembers,
      'groupName': instance.groupName,
      'groupPicture': instance.groupPicture,
      'createdAt':
          const MyNonNullableDateTimeConverter().toJson(instance.createdAt),
      'hiddenFrom': instance.hiddenFrom,
    };
