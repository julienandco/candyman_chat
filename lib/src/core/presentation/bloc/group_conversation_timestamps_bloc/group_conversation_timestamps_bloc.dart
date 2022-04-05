import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:neon_chat/src/conversations/conversations.dart';
import 'package:neon_chat/src/core/domain/use_cases/initialize_timestamp_stream_uc.dart';
import 'package:neon_chat/src/core/domain/use_cases/sync_timestamps_with_firebase_uc.dart';

part 'group_conversation_timestamps_event.dart';
part 'group_conversation_timestamps_state.dart';
part 'group_conversation_timestamps_bloc.freezed.dart';

class GroupConversationTimestampsBloc extends Bloc<
    GroupConversationTimestampsEvent, GroupConversationTimestampsState> {
  // final GetAllGroupTimestampsUC getAllTimestampsUC;
  final InitializeTimestampStreamUC initStreamUC;
  final SyncTimestampsWithFirebaseUC syncTimestampsWithFirebaseUC;
  StreamSubscription<Map<String, DateTime>>? _timestampsStream;
  String? _userID;

  final _firebaseSyncIntervalInSeconds = 60;

  DateTime? _lastSyncToFirebase;

  //additional flag for update needs
  bool _hadNewChangesSinceLastSync = false;

  Timer? _timer;

  GroupConversationTimestampsBloc({
    required this.initStreamUC,
    required this.syncTimestampsWithFirebaseUC,
    // required this.getAllTimestampsUC,
  }) : super(const _Uninitialized()) {
    on<_InitializeTimestamps>(_initializeGroupConversationTimestamps);
    on<_OnDataReceived>(_onDataReceived);
    on<_SetNewTimestampForConversation>(_setNewTimestampForConversation);

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

      newTimestamps[event.conversationId] = event.timestamp;
      _hadNewChangesSinceLastSync = true;
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

  DateTime getLastSeenTimestampForConversation(Conversation conversation) {
    DateTime timestamp = DateTime.now();
    final currentState = state;
    if (currentState is _$_GroupConversationTimestampsLoaded &&
        conversation.isGroupChat) {
      final currentTimestampForConversation =
          currentState.timestampMap[conversation.id];
      if (currentTimestampForConversation == null) {
        add(GroupConversationTimestampsEvent.setNewTimestamp(
            conversationId: conversation.id, timestamp: timestamp));
      } else {
        return currentTimestampForConversation;
      }
    }
    return timestamp;
  }

  @override
  Future<void> close() {
    _timestampsStream?.cancel();
    _timer?.cancel();
    _userID = null;
    return super.close();
  }
}
