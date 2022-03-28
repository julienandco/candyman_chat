import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:neon_chat/src/conversations/conversations.dart';

part 'conversations_state.dart';
part 'conversations_event.dart';
part 'conversations_bloc.freezed.dart';

class ConversationsBloc extends Bloc<ConversationsEvent, ConversationsState> {
  StreamSubscription? _conversationsStream;
  late final List<StreamSubscription> _conversationItemStreams = [];

  final InitializeConversationsStreamUC initializeConversationsStreamUC;
  final InitializeConversationItemStreamUC initializeConversationItemStreamUC;
  final HideConversationUC hideConversationUC;

  ConversationsBloc({
    required this.initializeConversationsStreamUC,
    required this.initializeConversationItemStreamUC,
    required this.hideConversationUC,
  }) : super(const _Initial()) {
    _conversationsStream = initializeConversationsStreamUC(
      onData: (event) {
        if (event.isNotEmpty) {
          add(_FetchChatItems(event));
        } else {
          add(const _OnData([]));
        }
      },
      onError: (err) => add(
        const _OnError(),
      ),
    );

    on<ConversationsEvent>((event, emit) {
      event.when(
        fetchChatItems: (conversations) {
          _conversationItemStreams.map((e) => e.cancel());

          for (var conversation in conversations) {
            if (conversation.timestamp != null) {
              final chatPersonId = conversation.conversationMembers.firstWhere(
                  (element) =>
                      element != FirebaseAuth.instance.currentUser!.uid);

              final chatStream = initializeConversationItemStreamUC(
                conversation: conversation,
                otherUserId: chatPersonId,
                onData: (event) => add(_OnChatItemsData(event)),
                onError: (err) {
                  log('fetchChatItems $err', name: '$runtimeType');
                },
              );
              _conversationItemStreams.add(chatStream);
            }
          }
        },
        
        onChatItemsData: (conversationItem) {
          emit(const ConversationsState.loadInProgress());
          emit(
            state.maybeMap(
              loadSuccess: (state) {
                final conversations = state.conversations;
                conversations.removeWhere((element) =>
                    element.conversation.id ==
                    conversationItem.conversation.id);
                conversations.add(conversationItem);
                conversations.sort(
                  (b, a) {
                    return (a.lastMessage.timestamp ?? DateTime.now())
                        .compareTo((b.lastMessage.timestamp ?? DateTime.now()));
                  },
                );
                return ConversationsState.loadSuccess(conversations);
              },
              orElse: () => ConversationsState.loadSuccess([conversationItem]),
            ),
          );
        },

        onData: (conversations) =>
            emit(ConversationsState.loadSuccess(conversations)),
        onError: () => emit(const ConversationsState.loadFailure()),
        dispose: () {
          _conversationsStream?.cancel();
          _conversationItemStreams.map((e) => e.cancel());
          _conversationsStream = null;
          emit(const ConversationsState.initial());
        },

        hideConversation: (conversationId) {
          emit(
            state.maybeMap(
              loadSuccess: (state) {
                var conversations = List.of(state.conversations);
                conversations.removeWhere(
                  (element) => element.conversation.id == conversationId,
                );
                return ConversationsState.loadSuccess(conversations);
              },
              orElse: () => state,
            ),
          );
          hideConversationUC(conversationId);
        },
      );
    });

    @override
    Future<void> close() {
      _conversationsStream?.cancel();
      _conversationItemStreams.map((e) => e.cancel());
      return super.close();
    }
  }
}
