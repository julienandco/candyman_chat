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

  @visibleForTesting
  List<ConversationItem> conversations = [];

  ConversationsSearchBloc()
      : super(const ConversationsSearchState.state(conversations: [])) {
    on<ConversationsSearchEvent>(
      (event, emit) {
        event.when(
          setEntries: (conversations) {
            conversations = conversations;
          },
          searchSwitch: (isActive) => emit(
            state.copyWith(
              isSearchActive: isActive,
              conversations: isActive ? conversations : [],
            ),
          ),
          query: (searchString) {
            final results = <ConversationItem>{};
            for (int i = 0; i < conversations.length; i++) {
              String data = conversations[i].conversationPartner.name;
              if (data.toLowerCase().contains(searchString.toLowerCase())) {
                results.add(conversations[i]);
              }
            }

            emit(state.copyWith(
                isSearchActive: true, conversations: results.toList()));
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
