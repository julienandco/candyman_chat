import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:neon_chat/neon_chat.dart';

part 'group_conversation_timestamps_event.dart';
part 'group_conversation_timestamps_state.dart';
part 'group_conversation_timestamps_bloc.freezed.dart';

//TODOGROUPSEEN: this should have a stream of the timestamp map

class GroupConversationTimestampsBloc extends Bloc<
    GroupConversationTimestampsEvent, GroupConversationTimestampsState> {
  final GetAllGroupTimestampsUC getAllTimestampsUC;
  GroupConversationTimestampsBloc({
    required this.getAllTimestampsUC,
  }) : super(const _Uninitialized()) {
    on<_InitializeTimestamps>(_initializeGroupConversationTimestamps);
    on<_SetNewTimestampForConversation>(_setNewTimestampForConversation);
  }

  Future<void> _initializeGroupConversationTimestamps(
      _InitializeTimestamps event, Emitter emit) async {
    final timestampMap = await getAllTimestampsUC();
    emit(GroupConversationTimestampsState.loaded(timestampMap));
  }

  void _setNewTimestampForConversation(
      _SetNewTimestampForConversation event, Emitter emit) {
    final currentState = state;
    if (currentState is _GroupConversationTimestampsLoaded) {
      final currentMap = currentState.timestampMap;
      Map<String, DateTime> newTimestamps = currentMap.timestamps;

      newTimestamps[event.conversationId] = event.timestamp;
      final newMap = TimestampMap(
          lastUpdate: currentMap.lastUpdate, timestamps: newTimestamps);
      emit(GroupConversationTimestampsState.loaded(newMap));
    }
  }
}
