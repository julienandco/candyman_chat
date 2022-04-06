part of 'current_conversation_cubit.dart';

@freezed
class CurrentConversationState with _$CurrentConversationState {
  const factory CurrentConversationState.current({
    ConversationItem? conversationItem,
  }) = _State;
}
