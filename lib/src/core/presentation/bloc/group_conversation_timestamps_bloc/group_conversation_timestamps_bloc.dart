import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:neon_chat/src/conversations/conversations.dart';
import 'package:neon_chat/src/core/core.dart';
import 'package:rxdart/rxdart.dart';

part 'group_conversation_timestamps_event.dart';
part 'group_conversation_timestamps_state.dart';
part 'group_conversation_timestamps_bloc.freezed.dart';

class GroupConversationTimestampsBloc extends Bloc<
    GroupConversationTimestampsEvent, GroupConversationTimestampsState> {
  final InitializeTimestampStreamUC initStreamUC;
  final SyncTimestampsWithFirebaseUC syncTimestampsWithFirebaseUC;
  StreamSubscription<Map<String, DateTime>>? _timestampsStream;
  String? _userID;

  final _firebaseSyncIntervalInSeconds = 60;

  final _timestampUpdateDebounceInSeconds = 3;

  DateTime? _lastSyncToFirebase;

  //additional flag for update needs
  bool _hadNewChangesSinceLastSync = false;

  Timer? _timer;

  GroupConversationTimestampsBloc({
    required this.initStreamUC,
    required this.syncTimestampsWithFirebaseUC,
  }) : super(const _Uninitialized()) {
    on<_InitializeTimestamps>(_initializeGroupConversationTimestamps);
    on<_OnDataReceived>(_onDataReceived);
    on<_SetNewTimestampForConversation>(
      _setNewTimestampForConversation,
      transformer: debounceRestartable(
          Duration(seconds: _timestampUpdateDebounceInSeconds)),
    );

    _timer = Timer.periodic(Duration(seconds: _firebaseSyncIntervalInSeconds),
        (Timer t) {
      final currentState = state;
      if (currentState is _$_GroupConversationTimestampsLoaded &&
          _needsToSync) {
        log('periodically syncing local group timestamps to firebase...',
            name: '$runtimeType');
        _lastSyncToFirebase = DateTime.now();
        _hadNewChangesSinceLastSync = false;
        syncTimestampsWithFirebaseUC(
            userId: _userID!, map: currentState.timestampMap);
      }
    });
  }

  Future<void> _initializeGroupConversationTimestamps(
      _InitializeTimestamps event, Emitter emit) async {
    _userID = event.userID;
    _timestampsStream = initStreamUC(
        userID: _userID!,
        onData: (timestampMap) => add(_OnDataReceived(timestampMap)));
  }

  void _onDataReceived(_OnDataReceived event, Emitter emit) {
    emit(GroupConversationTimestampsState.loaded(event.timestamps));
  }

  void _setNewTimestampForConversation(
      _SetNewTimestampForConversation event, Emitter emit) {
    final currentState = state;
    if (currentState is _GroupConversationTimestampsLoaded) {
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
        syncTimestampsWithFirebaseUC(userId: _userID!, map: newTimestamps);
      }
      emit(GroupConversationTimestampsState.loaded(newTimestamps));
    }
  }

  bool get _needsToSync =>
      _lastSyncToFirebase == null ||
      (DateTime.now().difference(_lastSyncToFirebase!).inSeconds >=
              _firebaseSyncIntervalInSeconds &&
          _hadNewChangesSinceLastSync);

  @override
  Future<void> close() {
    _timestampsStream?.cancel();
    _timer?.cancel();
    _userID = null;
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
