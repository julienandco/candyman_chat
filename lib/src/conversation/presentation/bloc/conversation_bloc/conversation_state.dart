part of 'conversation_bloc.dart';

@freezed
class ConversationState with _$ConversationState {
  const ConversationState._();

  const factory ConversationState.initial() = _Initial;
  const factory ConversationState.loadInProgress() = _LoadInProgress;
  const factory ConversationState.loadSuccess({
    required List<ConversationMessage> messages,
    required Conversation conversation,
  }) = _LoadSuccess;
  const factory ConversationState.loadFailure() = _LoadFailure;

  List<ConversationMessage> getMediaMessages() => maybeMap(
        loadSuccess: (state) {
          return List<ConversationMessage>.from(
            state.messages.where((element) =>
                element.type == ConversationMessageType.image ||
                element.type == ConversationMessageType.video),
          );
        },
        orElse: () => [],
      );
}
