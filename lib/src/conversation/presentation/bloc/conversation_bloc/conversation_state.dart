part of 'conversation_bloc.dart';

@freezed
class ConversationState with _$ConversationState {
  const ConversationState._();

  const factory ConversationState.initial() = _Initial;
  const factory ConversationState.loadInProgress() = _LoadInProgress;
  const factory ConversationState.loadSuccess({
    required List<ChatMessage> messages,
    required Conversation conversation,
    required String displayName,
    required DateTime groupConversationLastSeenTimestamp,
  }) = _LoadSuccess;
  const factory ConversationState.loadFailure() = _LoadFailure;

  List<ChatMessage> getMediaMessages() => maybeMap(
        loadSuccess: (state) {
          return List<ChatMessage>.from(
            state.messages.where((element) =>
                element.type == ChatMessageType.image ||
                element.type == ChatMessageType.video),
          );
        },
        orElse: () => [],
      );
}
