import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:neon_chat/neon_chat.dart';

part 'conversations_state.dart';
part 'conversations_event.dart';
part 'conversations_bloc.freezed.dart';

class ConversationsBloc extends Bloc<ConversationsEvent, ConversationsState> {
  StreamSubscription? _conversationsStream;
  Stream<FirebaseUser>? _me;

  late final List<StreamSubscription> _conversationItemStreams = [];

  final InitializeConversationsStreamUC initializeConversationsStreamUC;
  final InitializeConversationItemStreamUC initializeConversationItemStreamUC;
  final HideConversationUC hideConversationUC;
  final GetFirebaseUserUC getFirebaseUserUC;
  final CreateConversationUC createConversationUC;
  final CreateGroupConversationUC createGroupConversationUC;

  ConversationsBloc({
    required this.initializeConversationsStreamUC,
    required this.initializeConversationItemStreamUC,
    required this.hideConversationUC,
    required this.getFirebaseUserUC,
    required this.createConversationUC,
    required this.createGroupConversationUC,
  }) : super(const _Uninitialized()) {
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
        initialize: (myId) async {
          _me = getFirebaseUserUC(userId: myId);
          emit(const ConversationsState.initialized());
        },
        fetchChatItems: (conversations) {
          _conversationItemStreams.map((e) => e.cancel());

          for (var conversation in conversations) {
            if (conversation.createdAt != null) {
              final chatStream = initializeConversationItemStreamUC(
                conversation: conversation,
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
          emit(
            state.maybeMap(
              loadSuccess: (state) {
                final conversations = state.conversations;
                conversations.removeWhere((element) =>
                    element.conversation.id ==
                    conversationItem.conversation.id);
                conversations.add(conversationItem);

                // sorting: newest unreads first, then chronologically
                conversations.sort(
                  (b, a) {
                    if (a.unreadMessagesCount > 0 &&
                        b.unreadMessagesCount == 0) {
                      return 1;
                    } else if (b.unreadMessagesCount > 0 &&
                        a.unreadMessagesCount == 0) {
                      return -1;
                    } else {
                      // both have none or some unread messages => chronologically
                      return (a.lastMessage.timestamp ?? DateTime.now())
                          .compareTo(
                              (b.lastMessage.timestamp ?? DateTime.now()));
                    }
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
          _me = null;
          emit(const ConversationsState.uninitialized());
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
        createConversation: (creationData, onSuccess) async {
          final currentState = state;
          if (_isInit && currentState is _LoadSuccess) {
            final me = await _me!.first;
            final conversation = await createConversationUC(
              me: me,
              creationData: creationData,
            );

            final convoItem = _getConversationItemForConversation(
                currentItems: currentState.conversations,
                conversation: conversation);

            onSuccess?.call(convoItem);
          }
        },
        createGroupConversation: (creationData, onSuccess) async {
          final currentState = state;
          if (_isInit && currentState is _LoadSuccess) {
            final me = await _me!.first;
            final conversation = await createGroupConversationUC(
              me: me,
              creationData: creationData,
            );

            final convoItem = _getConversationItemForConversation(
                currentItems: currentState.conversations,
                conversation: conversation);

            onSuccess?.call(convoItem);
          }
        },
      );
    });
  }

  bool get _isInit => _me != null;

  ConversationItem _getConversationItemForConversation({
    required List<ConversationItem> currentItems,
    required Conversation conversation,
  }) {
    // either return the already existing conversation item or create
    // a new one.
    return currentItems.firstWhere(
      (convo) => convo.conversation.id == conversation.id,
      orElse: () {
        final newConvoItem = ConversationItem(
            conversation: conversation,
            lastMessage: ChatMessage.empty(),
            unreadMessagesCount: 0);

        return newConvoItem;
      },
    );
  }

  @override
  Future<void> close() {
    _conversationsStream?.cancel();
    _conversationItemStreams.map((e) => e.cancel());
    _me = null;
    return super.close();
  }
}
