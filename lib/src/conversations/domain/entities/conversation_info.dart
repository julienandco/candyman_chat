import 'package:neon_chat/src/core/data/models/datetime_converters.dart';

class ConversationInfo {
  final String id;
  final bool isGroupConversation;
  final DateTime createdAt;

  ///
  /// Has two elements for a 1-on-1 conversation and n elements for a group
  /// conversation.
  ///
  final List<String> conversationMembers;

  ///
  /// Is null for a 1-on-1 conversation and otherwise the name of the group
  /// conversation.
  ///
  final String? groupName;

  ///
  /// Is null for a 1-on-1 conversation and otherwise the upload id of the
  /// group conversation thumbnail
  ///
  final String? groupPicture;
  final List<String> hiddenFrom;

  const ConversationInfo({
    required this.id,
    required this.isGroupConversation,
    required this.createdAt,
    required this.conversationMembers,
    this.groupName,
    this.groupPicture,
    this.hiddenFrom = const [],
  });

  factory ConversationInfo.fromJson(Map<String, dynamic> json) =>
      ConversationInfo(
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

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'isGroupConversation': isGroupConversation,
        'conversationMembers': conversationMembers,
        'groupName': groupName,
        'groupPicture': groupPicture,
        'createdAt': const MyNonNullableDateTimeConverter().toJson(createdAt),
        'hiddenFrom': hiddenFrom,
      };
}
