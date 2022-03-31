part of 'conversation_search_bloc.dart';

@freezed
class ConversationSearchState with _$ConversationSearchState {
  const ConversationSearchState._();
  const factory ConversationSearchState.state({
    required List<int> messageIndices,
    @Default(0) int currentResultIndex,
    @Default(false) bool isSearchActive,
  }) = _State;
  bool get canGoResultUp =>
      messageIndices.asMap().containsKey(currentResultIndex + 1);
  bool get canGoResultDown =>
      messageIndices.asMap().containsKey(currentResultIndex - 1);
}
