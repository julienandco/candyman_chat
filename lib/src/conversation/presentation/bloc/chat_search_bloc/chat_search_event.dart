part of 'chat_search_bloc.dart';

@freezed
class ChatSearchEvent with _$ChatSearchEvent {
  const factory ChatSearchEvent.initialize(List<ChatMessage> messages) =
      _Initialize;
  const factory ChatSearchEvent.toggleSearch() = _ToggleSearch;
  const factory ChatSearchEvent.query(String term) = _Query;
  const factory ChatSearchEvent.onGoResultUp() = _OnGoResultUp;
  const factory ChatSearchEvent.onGoResultDown() = _OnGoResultDown;
}
