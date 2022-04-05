import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:neon_chat/neon_chat.dart';

part 'conversations_state.dart';
part 'conversations_event.dart';
part 'conversations_bloc.freezed.dart';

class ConversationsBloc extends Bloc<ConversationsEvent, ConversationsState> {
  StreamSubscription? _conversationsStream;
  Stream<FirebaseUser>? _me;
  Map<String, DateTime>? _timestampMap;

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
    on<_InitializeMyFirebaseUser>(_onInitialize);
    on<_FetchChatItems>(_onFetchChatItems);
    on<_OnChatItemsData>(_onReceivedChatItemsData);
    on<_OnData>(_onReceivedData);
    on<_HideConversation>(_onHideConversation);
    on<_CreateConversation>(_onCreateConversation);
    on<_CreateGroupConversation>(_onCreateGroupConversation);
    on<_OnError>(_onError);
    on<_Dispose>(_onDispose);
  }

  Future<void> _onInitialize(
      _InitializeMyFirebaseUser event, Emitter emit) async {
    _me = getFirebaseUserUC(userId: event.myId);

    _timestampMap = event.timestamps;

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
    emit(const ConversationsState.initialized());
  }

  void _onFetchChatItems(_FetchChatItems event, Emitter emit) {
    if (_isInit) {
      _conversationItemStreams.map((e) => e.cancel());

      for (var conversation in event.conversations) {
        if (conversation.createdAt != null) {
          final chatStream = initializeConversationItemStreamUC(
            conversation: conversation,
            timestamp: Timestamp.fromDate(
                _timestampMap![conversation.id] ?? DateTime.now()),
            onData: (event) => add(_OnChatItemsData(event)),
            onError: (err) {
              log('fetchChatItems $err', name: '$runtimeType');
            },
          );
          _conversationItemStreams.add(chatStream);
        }
      }
    }
  }

  void _onReceivedChatItemsData(_OnChatItemsData event, Emitter emit) {
    if (_isInit) {
      emit(
        state.maybeMap(
          loadSuccess: (state) {
            final conversations = state.conversations;
            conversations.removeWhere((element) =>
                element.conversation.id ==
                event.conversationItem.conversation.id);
            conversations.add(event.conversationItem);

            // sorting: newest unreads first, then chronologically
            conversations.sort(
              (b, a) {
                if (a.unreadMessagesCount > 0 && b.unreadMessagesCount == 0) {
                  return 1;
                } else if (b.unreadMessagesCount > 0 &&
                    a.unreadMessagesCount == 0) {
                  return -1;
                } else {
                  // both have none or some unread messages => chronologically
                  return (a.lastMessage.timestamp ?? DateTime.now())
                      .compareTo((b.lastMessage.timestamp ?? DateTime.now()));
                }
              },
            );
            return ConversationsState.loadSuccess(
              conversations: conversations,
            );
          },
          orElse: () => ConversationsState.loadSuccess(
            conversations: [event.conversationItem],
          ),
        ),
      );
    }
  }

  void _onReceivedData(_OnData event, Emitter emit) => emit(
        ConversationsState.loadSuccess(
          conversations: event.conversations,
        ),
      );

  void _onHideConversation(_HideConversation event, Emitter emit) {
    if (_isInit) {
      emit(
        state.maybeMap(
          loadSuccess: (state) {
            var conversations = List.of(state.conversations);
            conversations.removeWhere(
              (element) => element.conversation.id == event.conversationId,
            );
            return ConversationsState.loadSuccess(
              conversations: conversations,
            );
          },
          orElse: () => state,
        ),
      );
      hideConversationUC(event.conversationId);
    }
  }

  Future<void> _onCreateConversation(
      _CreateConversation event, Emitter emit) async {
    final currentState = state;
    if (_isInit && currentState is _LoadSuccess) {
      final me = await _me!.first;
      final conversation = await createConversationUC(
        me: me,
        creationData: event.creationData,
      );

      final convoItem = _getConversationItemForConversation(
          currentItems: currentState.conversations, conversation: conversation);

      event.onSuccessfullyCreatedConversation?.call(convoItem);
    }
  }

  Future<void> _onCreateGroupConversation(
      _CreateGroupConversation event, Emitter emit) async {
    final currentState = state;
    if (_isInit && currentState is _LoadSuccess) {
      final me = await _me!.first;
      final conversation = await createGroupConversationUC(
        me: me,
        creationData: event.creationData,
      );

      final convoItem = _getConversationItemForConversation(
          currentItems: currentState.conversations, conversation: conversation);

      event.onSuccessfullyCreatedGroupConversation?.call(convoItem);
    }
  }

  void _onError(_OnError event, Emitter emit) =>
      emit(const ConversationsState.loadFailure());

  void _onDispose(_Dispose event, Emitter emit) {
    _conversationsStream?.cancel();
    _conversationItemStreams.map((e) => e.cancel());
    _conversationsStream = null;
    _me = null;
    emit(const ConversationsState.uninitialized());
  }

  bool get _isInit => _me != null && _timestampMap != null;

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
