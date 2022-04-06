import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:neon_chat/src/conversations/conversations.dart';

part 'conversations_search_event.dart';
part 'conversations_search_state.dart';

part 'conversations_search_bloc.freezed.dart';

class ConversationsSearchBloc
    extends Bloc<ConversationsSearchEvent, ConversationsSearchState> {
  final textController = TextEditingController();
  final SearchConversationsUC searchUC;

  ConversationsSearchBloc(this.searchUC)
      : super(const ConversationsSearchState.state(conversations: [])) {
    on<ConversationsSearchEvent>(
      (event, emit) {
        event.when(
          initialize: (conversations) {
            searchUC.initialize(conversations);
          },
          toggleSearch: (isActive) => emit(
            state.copyWith(
              isSearchActive: isActive,
              conversations: isActive ? searchUC.conversations : [],
            ),
          ),
          query: (searchString) {
            final results = searchUC.search(searchString);

            emit(state.copyWith(isSearchActive: true, conversations: results));
          },
          onResult: (results) => emit(
            state.copyWith(
              isSearchActive: true,
              conversations: results,
            ),
          ),
        );
      },
    );
  }
}
