// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Conversation _$$_ConversationFromJson(Map<String, dynamic> json) =>
    _$_Conversation(
      id: json['id'] as String,
      groupName: json['groupName'] as String?,
      groupPicture: json['groupPicture'] as String?,
      conversationMembers: const MyFirebaseUserListConverter()
          .fromJson(json['conversationMembers']),
      isGroupConversation: json['isGroupConversation'] as bool,
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
      'groupPicture': instance.groupPicture,
      'conversationMembers': const MyFirebaseUserListConverter()
          .toJson(instance.conversationMembers),
      'isGroupConversation': instance.isGroupConversation,
      'createdAt': const MyDateTimeConverter().toJson(instance.createdAt),
      'hiddenFrom': instance.hiddenFrom,
    };
