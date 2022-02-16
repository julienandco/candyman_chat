import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

//TODO: import
import 'package:neon_chat/src/conversations/domain/entities/conversation_item/conversation_item.dart';

part 'conversations_search_event.dart';
part 'conversations_search_state.dart';

part 'conversations_search_bloc.freezed.dart';

class ConversationsSearchBloc
    extends Bloc<ConversationsSearchEvent, ConversationsSearchState> {
  final textController = TextEditingController();
  List<ConversationItem> _conversations = [];

  ConversationsSearchBloc()
      : super(const ConversationsSearchState.state(conversations: [])) {
    on<ConversationsSearchEvent>(
      (event, emit) {
        event.when(
          setEntries: (conversations) {
            _conversations = conversations;
          },
          searchSwitch: (isActive) => emit(
            state.copyWith(
              isSearchActive: isActive,
              conversations: isActive ? _conversations : [],
            ),
          ),
          query: (searchString) {
            final results = <ConversationItem>{};
            for (int i = 0; i < _conversations.length; i++) {
              String data = _conversations[i].conversationPartner.name;
              if (data.toLowerCase().contains(searchString.toLowerCase())) {
                results.add(_conversations[i]);
              }
            }

            add(ConversationsSearchEvent.onResult(results.toList()));
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
