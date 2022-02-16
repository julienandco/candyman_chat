part of 'conversations_search_bloc.dart';

@freezed
class ConversationsSearchEvent with _$ConversationsSearchEvent {
  const factory ConversationsSearchEvent.setEntries(
      List<ConversationItem> conversations) = _SetEntries;
  const factory ConversationsSearchEvent.searchSwitch(bool isActive) =
      _SearchSwitch;
  const factory ConversationsSearchEvent.query(String searchString) = _Query;
  const factory ConversationsSearchEvent.onResult(
      List<ConversationItem> conversations) = _OnResult;
}
