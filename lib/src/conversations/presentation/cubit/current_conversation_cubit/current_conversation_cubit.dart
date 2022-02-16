import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'current_conversation_state.dart';

part 'current_conversation_cubit.freezed.dart';

class CurrentConversationCubit extends Cubit<CurrentConversationState> {
  CurrentConversationCubit() : super(const CurrentConversationState.current());

  void onCurrentConversationChanged(
          String userProfileId, String conversationId) =>
      emit(
        state.copyWith(
          userProfileId: userProfileId,
          conversationId: conversationId,
        ),
      );
}
