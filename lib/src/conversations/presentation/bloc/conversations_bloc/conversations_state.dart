part of 'conversations_bloc.dart';

@freezed
class ConversationsState with _$ConversationsState {
  const ConversationsState._();
  const factory ConversationsState.uninitialized() = _Uninitialized;
  const factory ConversationsState.loadInProgress(
      {Map<String, DateTime>? timestampMap}) = _LoadInProgress;
  const factory ConversationsState.loadSuccess({
    required List<ConversationItem> conversations,
    required Map<String, DateTime> timestampMap,
  }) = _LoadSuccess;
  const factory ConversationsState.loadFailure() = _LoadFailure;

  bool get haveUnreadMessages {
    return maybeMap(
      loadSuccess: (state) {
        for (var conversation in state.conversations) {
          if (conversation.unreadMessagesCount > 0) return true;
        }
        return false;
      },
      orElse: () => false,
    );
  }

  bool get hasUnreadMessages {
    return maybeMap(
      loadSuccess: (state) {
        for (var conversation in state.conversations) {
          if (conversation.unreadMessagesCount > 0) {
            return true;
          }
        }
        return false;
      },
      orElse: () => false,
    );
  }

  int get numOfUnreadMessages {
    return maybeMap(
      loadSuccess: (state) {
        int num = 0;
        for (var conversation in state.conversations) {
          num += conversation.unreadMessagesCount;
        }
        return num;
      },
      orElse: () => 0,
    );
  }
}
