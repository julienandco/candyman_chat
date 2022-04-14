part of 'conversation_search_bloc.dart';

@freezed
class ConversationSearchEvent with _$ConversationSearchEvent {
  const factory ConversationSearchEvent.initialize({
    required List<ConversationMessage> messages,
    required DateTime? lastSeenMessageTimestamp,
  }) = _Initialize;
  const factory ConversationSearchEvent.toggleSearch() = _ToggleSearch;
  const factory ConversationSearchEvent.query(String term) = _Query;
  const factory ConversationSearchEvent.onGoResultUp() = _OnGoResultUp;
  const factory ConversationSearchEvent.onGoResultDown() = _OnGoResultDown;
}
