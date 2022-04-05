part of 'group_conversation_timestamps_bloc.dart';

@freezed
class GroupConversationTimestampsEvent with _$GroupConversationTimestampsEvent {
  const factory GroupConversationTimestampsEvent.initialize() =
      _InitializeTimestamps;
  const factory GroupConversationTimestampsEvent.setNewTimestamp({
    required String conversationId,
    required DateTime timestamp,
  }) = _SetNewTimestampForConversation;
}
