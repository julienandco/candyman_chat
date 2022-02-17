part of 'chat_bloc.dart';

@freezed
class ChatState with _$ChatState {
  const ChatState._();

  const factory ChatState.initial() = _Initial;
  const factory ChatState.loadInProgress() = _LoadInProgress;
  const factory ChatState.loadSuccess({
    required List<ChatMessage> messages,
    required FirebaseUser userProfile,
    required Conversation conversation,
  }) = _LoadSuccess;
  const factory ChatState.loadFailure() = _LoadFailure;

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
