part of 'chat_search_bloc.dart';

@freezed
class ChatSearchState with _$ChatSearchState {
  const ChatSearchState._();
  const factory ChatSearchState.state({
    required List<int> messageIndices,
    @Default(0) int currentResultIndex,
    @Default(false) bool isSearchActive,
  }) = _State;
  bool get canGoResultUp =>
      messageIndices.asMap().containsKey(currentResultIndex + 1);
  bool get canGoResultDown =>
      messageIndices.asMap().containsKey(currentResultIndex - 1);
}
