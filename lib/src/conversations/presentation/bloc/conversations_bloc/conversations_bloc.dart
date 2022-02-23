import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rxdart/rxdart.dart';

import 'package:neon_chat/src/conversation/conversation.dart';
import 'package:neon_chat/src/conversations/conversations.dart';
import 'package:neon_chat/src/core/core.dart';

part 'conversations_state.dart';
part 'conversations_event.dart';
part 'conversations_bloc.freezed.dart';

class ConversationsBloc extends Bloc<ConversationsEvent, ConversationsState> {
  final ConversationsRepository conversationsRepository;
  final ConversationRepository conversationRepository;
  final FirebaseUserProfileRepository userProfileRepository;

  StreamSubscription? _conversationsStream;
  late final List<StreamSubscription> _chatsItemsStream = [];

  ConversationsBloc({
    required this.conversationsRepository,
    required this.userProfileRepository,
    required this.conversationRepository,
  }) : super(const _Initial()) {
    _conversationsStream = conversationsRepository.getAllConversations().listen(
      (event) {
        if (event.isNotEmpty) {
          add(
            _FetchChatItems(event),
          );
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
          _chatsItemsStream.map((e) => e.cancel());

          for (var conversation in conversations) {
            if (conversation.timestamp != null) {
              final chatPersonId = conversation.conversationMembers.firstWhere(
                  (element) =>
                      element != FirebaseAuth.instance.currentUser!.uid);
              //TODO: inject that in package?

              // (element) =>
              //     element != getIt<FirebaseAuth>().currentUser!.uid);

              final chatStream = CombineLatestStream.combine3(
                conversationRepository.getLastMessages(conversation.id),
                userProfileRepository.getUserProfile(chatPersonId),
                conversationsRepository.getUnreadMessagesCount(conversation.id),
                (
                  ChatMessage lastMessage,
                  FirebaseUser userProfile,
                  int unreadCount,
                ) =>
                    ConversationItem(
                  lastMessage: lastMessage,
                  conversationPartner: userProfile,
                  conversation: conversation,
                  unreadMessagesCount: unreadCount,
                ),
              ).listen(
                (event) => add(
                  _OnChatItemsData(event),
                ),
                onError: (err) {
                  log('fetchChatItems $err', name: '$runtimeType');
                },
              );
              _chatsItemsStream.add(chatStream);
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
        onError: () => emit(
          const ConversationsState.loadFailure(),
        ),
        dispose: () {
          _conversationsStream?.cancel();
          _chatsItemsStream.map((e) => e.cancel());
          _conversationsStream = null;
          emit(
            const ConversationsState.initial(),
          );
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
          conversationsRepository.hideConversations(conversationId);
        },
      );
    });

    @override
    Future<void> close() {
      _conversationsStream?.cancel();
      _chatsItemsStream.map((e) => e.cancel());
      return super.close();
    }
  }
}
