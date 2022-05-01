import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:neon_chat/neon_chat.dart';
import 'package:rxdart/rxdart.dart';

part 'conversations_state.dart';
part 'conversations_event.dart';
part 'conversations_bloc.freezed.dart';

class ConversationsBloc extends Bloc<ConversationsEvent, ConversationsState> {
  StreamSubscription? _conversationsStream;
  Stream<FirebaseUser>? _me;
  String? _myId;

  late final List<StreamSubscription> _conversationItemStreams = [];

  final InitializeConversationsStreamUC initializeConversationsStreamUC;
  final InitializeConversationItemStreamUC initializeConversationItemStreamUC;
  final HideConversationUC hideConversationUC;
  final GetFirebaseUserUC getFirebaseUserUC;
  final CreateConversationUC createConversationUC;
  final CreateGroupConversationUC createGroupConversationUC;

  final InitializeTimestampStreamUC initTimestampStreamUC;
  final SyncTimestampsWithFirebaseUC syncTimestampsWithFirebaseUC;

  StreamSubscription<Map<String, DateTime>>? _timestampsStream;

  final _firebaseSyncIntervalInSeconds = 60;

  final _timestampUpdateDebounceInSeconds = 3;

  DateTime? _lastSyncToFirebase;

  //additional flag for update needs
  bool _hadNewChangesSinceLastSync = false;

  Timer? _timer;

  ConversationsBloc({
    required this.initializeConversationsStreamUC,
    required this.initializeConversationItemStreamUC,
    required this.hideConversationUC,
    required this.getFirebaseUserUC,
    required this.createConversationUC,
    required this.createGroupConversationUC,
    required this.initTimestampStreamUC,
    required this.syncTimestampsWithFirebaseUC,
  }) : super(const _Uninitialized()) {
    on<_InitializeMyFirebaseUser>(_onInitialize);
    on<_FetchConversationItems>(_onFetchChatItems);
    on<_OnConversationItemsData>(_onReceivedChatItemsData);
    on<_OnData>(_onReceivedData);
    on<_HideConversation>(_onHideConversation);
    on<_CreateConversation>(_onCreateConversation);
    on<_CreateGroupConversation>(_onCreateGroupConversation);
    on<_SetNewTimestampForGroupConversation>(
      _onSetNewTimestampForGroupConversation,
      transformer: debounceRestartable(
          Duration(seconds: _timestampUpdateDebounceInSeconds)),
    );
    on<_OnGroupTimestampsData>(_onTimestampsDataReceived);
    on<_OnError>(_onError);
    on<_Dispose>(_onDispose);

    _timer = Timer.periodic(Duration(seconds: _firebaseSyncIntervalInSeconds),
        (Timer t) {
      final currentState = state;
      if (currentState is _$_LoadSuccess && _needsToSync) {
        log('periodically syncing local group timestamps to firebase...',
            name: '$runtimeType');
        _lastSyncToFirebase = DateTime.now();
        _hadNewChangesSinceLastSync = false;
        syncTimestampsWithFirebaseUC(
            userId: _myId!, map: currentState.timestampMap);
      }
    });
  }

  Future<void> _onInitialize(
      _InitializeMyFirebaseUser event, Emitter emit) async {
    _me = getFirebaseUserUC(userId: event.myId);
    _myId = event.myId;

    _conversationsStream = initializeConversationsStreamUC(
      onData: (event) {
        if (event.isNotEmpty) {
          add(_FetchConversationItems(event));
        } else {
          add(const _OnData([]));
        }
      },
      onError: (err) => add(const _OnError()),
    );

    _timestampsStream = initTimestampStreamUC(
        userID: _myId!,
        onData: (timestampMap) => add(_OnGroupTimestampsData(timestampMap)));

    emit(const ConversationsState.loadSuccess(
        conversations: [], timestampMap: {}));
  }

  void _onFetchChatItems(_FetchConversationItems event, Emitter emit) {
    if (_isInit) {
      _conversationItemStreams.map((e) => e.cancel());

      final timestamps =
          state is _LoadSuccess ? (state as _LoadSuccess).timestampMap : {};

      for (var conversation in event.conversations) {
        if (conversation.createdAt != null) {
          final chatStream = initializeConversationItemStreamUC(
            conversation: conversation,
            timestamp: Timestamp.fromDate(
              timestamps[conversation.id] ?? DateTime.now(),
            ),
            onData: (event) => add(_OnConversationItemsData(event)),
            onError: (err) {
              log('fetchChatItems $err', name: '$runtimeType');
            },
          );
          _conversationItemStreams.add(chatStream);
        }
      }
    }
  }

  void _onReceivedChatItemsData(_OnConversationItemsData event, Emitter emit) {
    if (_isInit) {
      emit(
        state.maybeMap(
          loadSuccess: (state) {
            final conversations = [...state.conversations];
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
            return state.copyWith(
              conversations: conversations,
            );
          },
          orElse: () => ConversationsState.loadSuccess(
            conversations: [event.conversationItem],
            timestampMap: {},
          ),
        ),
      );
    }
  }

  void _onReceivedData(_OnData event, Emitter emit) {
    emit(
      state.maybeMap(
        orElse: () => ConversationsState.loadSuccess(
          conversations: event.conversations,
          timestampMap: {},
        ),
        loadSuccess: (loadedState) =>
            loadedState.copyWith(conversations: event.conversations),
      ),
    );
  }

  void _onHideConversation(_HideConversation event, Emitter emit) {
    if (_isInit) {
      emit(
        state.maybeMap(
          loadSuccess: (state) {
            var conversations = List.of(state.conversations);
            conversations.removeWhere(
              (element) => element.conversation.id == event.conversationId,
            );
            return state.copyWith(
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

    log('On Create: state = $currentState / $_isInit');

    if (_isInit && currentState is _LoadSuccess) {
      final me = await _me!.first;
      final conversation = await createConversationUC(
        me: me,
        creationData: event.creationData,
      );

      log('On Create: conversation = ${conversation.id}');

      final convoItem = _getConversationItemForConversation(
          currentItems: currentState.conversations, conversation: conversation);

      log('On Create: convoItem = ${convoItem.conversation.createdAt}');

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

  void _onTimestampsDataReceived(_OnGroupTimestampsData event, Emitter emit) {
    final currentState = state;
    if (currentState is _LoadSuccess) {
      emit(currentState.copyWith(timestampMap: event.timestamps));
    } else {
      emit(_LoadSuccess(conversations: [], timestampMap: event.timestamps));
    }
  }

  void _onSetNewTimestampForGroupConversation(
      _SetNewTimestampForGroupConversation event, Emitter emit) {
    final currentState = state;
    if (currentState is _LoadSuccess) {
      final currentMap = currentState.timestampMap;
      Map<String, DateTime> newTimestamps = currentMap;

      //check whether there is a change
      if (!currentMap.containsKey(event.conversationId) ||
          (currentMap.containsKey(event.conversationId) &&
              event.timestamp
                      .difference(currentMap[event.conversationId]!)
                      .inSeconds >=
                  1)) {
        _hadNewChangesSinceLastSync = true;
        newTimestamps[event.conversationId] = event.timestamp;
      }

      if (_needsToSync) {
        _lastSyncToFirebase = DateTime.now();
        _hadNewChangesSinceLastSync = false;
        syncTimestampsWithFirebaseUC(userId: _myId!, map: newTimestamps);
      }
      emit(currentState.copyWith(timestampMap: newTimestamps));
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

  bool get _isInit => _me != null && _myId != null;

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
            lastMessage: ConversationMessage.empty(),
            unreadMessagesCount: 0);

        return newConvoItem;
      },
    );
  }

  bool get _needsToSync =>
      _lastSyncToFirebase == null ||
      (DateTime.now().difference(_lastSyncToFirebase!).inSeconds >=
              _firebaseSyncIntervalInSeconds &&
          _hadNewChangesSinceLastSync);

  @override
  Future<void> close() {
    _conversationsStream?.cancel();
    _conversationItemStreams.map((e) => e.cancel());
    _me = null;
    _timestampsStream?.cancel();
    _timer?.cancel();
    _myId = null;
    return super.close();
  }

  EventTransformer<GroupConversationTimestampsEvent>
      debounceRestartable<GroupConversationTimestampsEvent>(
    Duration duration,
  ) {
    // This feeds the debounced event stream to restartable() and returns that
    // as a transformer.
    return (events, mapper) => restartable<GroupConversationTimestampsEvent>()
        .call(events.debounceTime(duration), mapper);
  }
}
