import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:neon_chat/src/core/domain/use_cases/initialize_timestamp_stream_uc.dart';
import 'package:neon_chat/src/core/domain/use_cases/sync_timestamps_with_firebase_uc.dart';

part 'group_conversation_timestamps_event.dart';
part 'group_conversation_timestamps_state.dart';
part 'group_conversation_timestamps_bloc.freezed.dart';

//TODOGROUPSEEN: this should have a stream of the timestamp map

class GroupConversationTimestampsBloc extends Bloc<
    GroupConversationTimestampsEvent, GroupConversationTimestampsState> {
  // final GetAllGroupTimestampsUC getAllTimestampsUC;
  final InitializeTimestampStreamUC initStreamUC;
  final SyncTimestampsWithFirebaseUC syncTimestampsWithFirebaseUC;
  StreamSubscription<Map<String, DateTime>>? _timestampsStream;
  String? _userID;

  //currently using a 60 sec debounce
  DateTime? _lastSyncToFirebase;

  GroupConversationTimestampsBloc({
    required this.initStreamUC,
    required this.syncTimestampsWithFirebaseUC,
    // required this.getAllTimestampsUC,
  }) : super(const _Uninitialized()) {
    on<_InitializeTimestamps>(_initializeGroupConversationTimestamps);
    on<_OnDataReceived>(_onDataReceived);
    on<_SetNewTimestampForConversation>(_setNewTimestampForConversation);
  }

  Future<void> _initializeGroupConversationTimestamps(
      _InitializeTimestamps event, Emitter emit) async {
    _userID = event.userID;
    _timestampsStream = initStreamUC(
        userID: _userID!,
        onData: (timestampMap) => add(_OnDataReceived(timestampMap)));
    // final timestampMap = await getAllTimestampsUC();
    // emit(GroupConversationTimestampsState.loaded(timestampMap));
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
      if (_needsToSync) {
        _lastSyncToFirebase = DateTime.now();
        syncTimestampsWithFirebaseUC(userId: _userID!, map: newTimestamps);
      }
      emit(GroupConversationTimestampsState.loaded(newTimestamps));
    }
  }

  bool get _needsToSync =>
      _lastSyncToFirebase == null ||
      DateTime.now().difference(_lastSyncToFirebase!).inSeconds >= 60;

  @override
  Future<void> close() {
    _timestampsStream?.cancel();
    _userID = null;
    return super.close();
  }
}
