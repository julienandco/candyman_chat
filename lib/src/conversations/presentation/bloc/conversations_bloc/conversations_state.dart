// part of 'conversations_bloc.dart';

// @freezed
// class ConversationsState with _$ConversationsState {
//   const ConversationsState._();
//   const factory ConversationsState.initial() = _Initial;
//   const factory ConversationsState.loadInProgress() = _LoadInProgress;
//   const factory ConversationsState.loadSuccess(
//     List<ConversationItem> conversations,
//   ) = _LoadSuccess;
//   const factory ConversationsState.loadFailure() = _LoadFailure;

//   bool get haveUnreadMessages {
//     return maybeMap(
//       loadSuccess: (state) {
//         for (var conversation in state.conversations) {
//           if (conversation.unreadMessagesCount > 0) return true;
//         }
//         return false;
//       },
//       orElse: () => false,
//     );
//   }

//   bool get haveUnreadPrivateMessages {
//     return maybeMap(
//       loadSuccess: (state) {
//         for (var conversation in state.conversations) {
//           if (conversation.unreadMessagesCount > 0 &&
//               !conversation.isPartyChat) {
//             return true;
//           }
//         }
//         return false;
//       },
//       orElse: () => false,
//     );
//   }

//   bool get haveUnreadPartyMessages {
//     return maybeMap(
//       loadSuccess: (state) {
//         for (var conversation in state.conversations) {
//           if (conversation.unreadMessagesCount > 0 &&
//               conversation.isPartyChat) {
//             return true;
//           }
//         }
//         return false;
//       },
//       orElse: () => false,
//     );
//   }

//   int get numOfUnreadMessages {
//     return maybeMap(
//       loadSuccess: (state) {
//         int num = 0;
//         for (var conversation in state.conversations) {
//           num += conversation.unreadMessagesCount;
//         }
//         return num;
//       },
//       orElse: () => 0,
//     );
//   }

//   List<ConversationItem> get partyConversations {
//     return maybeMap(
//       loadSuccess: (state) => List.of(state.conversations)
//         ..removeWhere((element) => element.converstaion.partyId == null),
//       orElse: () => [],
//     );
//   }

//   List<ConversationItem> get privateConversations {
//     return maybeMap(
//       loadSuccess: (state) => List.of(state.conversations)
//         ..removeWhere((element) => element.converstaion.partyId != null),
//       orElse: () => [],
//     );
//   }
// }
