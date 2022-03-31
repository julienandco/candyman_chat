part of 'conversations_bloc.dart';

@freezed
class ConversationsEvent with _$ConversationsEvent {
  const factory ConversationsEvent.initialize({
    required String myId,
  }) = _InitializeMyFirebaseUser;

  const factory ConversationsEvent.fetchChatItems(
    List<Conversation> conversations,
  ) = _FetchChatItems;

  const factory ConversationsEvent.onChatItemsData(
    ConversationItem conversationItem,
  ) = _OnChatItemsData;

  const factory ConversationsEvent.onData(
    List<ConversationItem> conversations,
  ) = _OnData;

  const factory ConversationsEvent.hideConversation(String conversationId) =
      _HideConversation;

  const factory ConversationsEvent.createConversation({
    required FirebaseUser conversationPartner,
    Function(ConversationItem)? onSuccessfullyCreatedConversation,
  }) = _CreateConversation;

  const factory ConversationsEvent.createGroupConversation({
    required List<FirebaseUser> conversationPartners,
    Function(ConversationItem)? onSuccessfullyCreatedGroupConversation,
  }) = _CreateGroupConversation;

  const factory ConversationsEvent.onError() = _OnError;

  const factory ConversationsEvent.dispose() = _Dispose;
}
