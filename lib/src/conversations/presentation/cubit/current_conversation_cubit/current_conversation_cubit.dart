import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:neon_chat/neon_chat.dart';

part 'current_conversation_state.dart';

part 'current_conversation_cubit.freezed.dart';

class CurrentConversationCubit extends Cubit<CurrentConversationState> {
  CurrentConversationCubit() : super(const CurrentConversationState.current());

  void onCurrentConversationChanged(ConversationItem conversationItem) => emit(
        state.copyWith(
          conversationItem: conversationItem,
        ),
      );
}
