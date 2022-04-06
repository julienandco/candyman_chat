import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import 'package:neon_chat/src/conversation/conversation.dart';

part 'conversation_search_state.dart';
part 'conversation_search_event.dart';
part 'conversation_search_bloc.freezed.dart';

class ConversationSearchBloc
    extends Bloc<ConversationSearchEvent, ConversationSearchState> {
  final searchUC = SearchConversationUC();

  /// This Function is called when no search results are found. This could
  /// for instance trigger the showing of a Toast or a Dialog.
  final void Function()? onNoSearchResultsFound;

  final messageListController = AutoScrollController();

  ConversationSearchBloc({this.onNoSearchResultsFound})
      : super(const _State(messageIndices: [])) {
    on<ConversationSearchEvent>((event, emit) {
      event.when(
        initialize: (messages, timestamp) {
          searchUC.initialize(messages);
          _jumpToLastSeenMessage(
              messages: messages, lastSeenTimestamp: timestamp);
        },
        toggleSearch: () => emit(
          state.copyWith(
            isSearchActive: !state.isSearchActive,
            messageIndices: [],
          ),
        ),
        query: (term) {
          final results = searchUC.search(term);
          emit(state.copyWith(
            messageIndices: results,
            currentResultIndex: 0,
          ));
          if (results.isNotEmpty) {
            _jumpToResult();
          } else {
            onNoSearchResultsFound?.call();
          }
        },
        onGoResultUp: () {
          if (state.canGoResultUp) {
            emit(state.copyWith(
              currentResultIndex: (state.currentResultIndex) + 1,
            ));
            _jumpToResult();
          }
        },
        onGoResultDown: () {
          if (state.canGoResultDown) {
            emit(state.copyWith(
              currentResultIndex: (state.currentResultIndex) - 1,
            ));
            _jumpToResult();
          }
        },
      );
    });
  }

  void _jumpToLastSeenMessage({
    required List<ChatMessage> messages,
    required DateTime lastSeenTimestamp,
  }) {
    final index = messages.lastIndexWhere(
        (message) => message.timestamp?.isAfter(lastSeenTimestamp) ?? false);
    if (index >= 0) {
      messageListController.scrollToIndex(
        index,
        preferPosition: AutoScrollPosition.end,
      );
    }
  }

  void _jumpToResult() {
    messageListController.scrollToIndex(
      state.messageIndices[state.currentResultIndex],
      preferPosition: AutoScrollPosition.end,
    );
  }
}
