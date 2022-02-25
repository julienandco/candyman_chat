part of 'current_conversation_cubit.dart';

@freezed
class CurrentConversationState with _$CurrentConversationState {
  const factory CurrentConversationState.current({
    String? userProfileId,
    String? conversationId,
  }) = _State;
}
