import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:neon_chat/src/core/data/models/datetime_converters.dart';

part 'conversation_info.freezed.dart';
part 'conversation_info.g.dart';

@freezed
class ConversationInfo with _$ConversationInfo {
  factory ConversationInfo({
    required String id,
    required bool isGroupConversation,
    @MyNonNullableDateTimeConverter() required DateTime createdAt,

    ///
    /// Has two elements for a 1-on-1 conversation and n elements for a group
    /// conversation.
    ///
    required List<String> conversationMembers,

    ///
    /// Is null for a 1-on-1 conversation and otherwise the name of the group
    /// conversation.
    ///
    String? groupName,

    ///
    /// Is null for a 1-on-1 conversation and otherwise the upload id of the
    /// group conversation thumbnail
    ///
    String? groupPicture,
    @Default([]) List<String> hiddenFrom,
  }) = _ConversationInfo;

  factory ConversationInfo.fromJson(Map<String, dynamic> json) =>
      _$ConversationInfoFromJson(json);
}
