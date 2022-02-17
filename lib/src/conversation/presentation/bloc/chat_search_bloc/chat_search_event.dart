part of 'chat_search_bloc.dart';

@freezed
class ChatSearchEvent with _$ChatSearchEvent {
  const factory ChatSearchEvent.setEntries(List<ChatMessage> messages) =
      _SetEntries;
  const factory ChatSearchEvent.searchSwitch() = _SearchSwitch;
  const factory ChatSearchEvent.query(String term) = _Query;
  const factory ChatSearchEvent.onResult(List<int> messageIndices) = _OnResult;
  const factory ChatSearchEvent.onGoResultUp() = _OnGoResultUp;
  const factory ChatSearchEvent.onGoResultDown() = _OnGoResultDown;
}
