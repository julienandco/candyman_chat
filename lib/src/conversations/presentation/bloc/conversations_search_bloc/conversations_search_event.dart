part of 'conversations_search_bloc.dart';

@freezed
class ConversationsSearchEvent with _$ConversationsSearchEvent {
  const factory ConversationsSearchEvent.initialize(
      List<ConversationItem> conversations) = _Initialize;
  const factory ConversationsSearchEvent.toggleSearch(bool isActive) =
      _ToggleSearch;
  const factory ConversationsSearchEvent.query(String searchString) = _Query;
  const factory ConversationsSearchEvent.onResult(
      List<ConversationItem> conversations) = _OnResult;
}
