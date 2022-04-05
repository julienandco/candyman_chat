part of 'group_conversation_timestamps_bloc.dart';

@freezed
class GroupConversationTimestampsState with _$GroupConversationTimestampsState {
  const factory GroupConversationTimestampsState.uninitialized() =
      _Uninitialized;
  const factory GroupConversationTimestampsState.loaded(
      Map<String, DateTime> timestampMap) = _GroupConversationTimestampsLoaded;
}
