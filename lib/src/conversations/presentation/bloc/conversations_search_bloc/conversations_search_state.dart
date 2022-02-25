part of 'conversations_search_bloc.dart';

@freezed
class ConversationsSearchState with _$ConversationsSearchState {
  const ConversationsSearchState._();
  const factory ConversationsSearchState.state({
    required List<ConversationItem> conversations,
    @Default(false) bool isSearchActive,
  }) = _State;
}
