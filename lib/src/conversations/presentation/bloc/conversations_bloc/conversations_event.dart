part of 'conversations_bloc.dart';

@freezed
class ConversationsEvent with _$ConversationsEvent {
  const factory ConversationsEvent.fetchConversations() = _FetchConversation;

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

  const factory ConversationsEvent.onError() = _OnError;

  const factory ConversationsEvent.dispose() = _Dispose;
}
