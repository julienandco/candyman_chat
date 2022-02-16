import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:neon_chat/src/conversations/domain/entities/conversation/conversation.dart';
import 'package:neon_chat/src/conversations/domain/entities/conversation_item/conversation_item.dart';

part 'conversations_state.dart';
part 'conversations_event.dart';
part 'conversations_bloc.freezed.dart';

class ConversationsBloc extends Bloc<ConversationsEvent, ConversationsState> {
  // final ConversationRepository conversationRepository;
  // final ChatRepository chatRepository;
  // final UserProfileRepository userProfileRepository;

  StreamSubscription? _conversatonsStream;
  late final List<StreamSubscription> _chatsItemsStream = [];

  void init() {
    if (_conversatonsStream == null) add(_FetchConversation());
  }

  void dispose() {
    add(_Dispose());
  }

  void hideConversation(String conversationId) => add(
        _HideConversation(conversationId),
      );
  ConversationsBloc() : super(const _Initial()) {
    on<ConversationsEvent>(
      (event, emit) {
        event.when();
      },
    );
  }
}

//TODO: old
// import 'dart:async';

// import 'package:bloc/bloc.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:papeo_app/core/data/models/firestore_user.dart';
// import 'package:papeo_app/core/domain/repositories/user_profile_repository.dart';
// import 'package:papeo_app/features/chat/data/models/chat_message_model.dart';
// import 'package:papeo_app/features/chat/domain/repository/chat_repository.dart';
// import 'package:papeo_app/features/chats/data/models/conversation_model.dart';
// import 'package:papeo_app/features/chats/domain/entities/conversation_item.dart';
// import 'package:papeo_app/features/chats/domain/repository/conversation_repository.dart';
// import 'package:papeo_app/injection.dart';
// import 'package:rxdart/rxdart.dart';
// part 'conversations_state.dart';
// part 'conversations_event.dart';
// part 'conversations_bloc.freezed.dart';

// class ConversationsBloc extends Bloc<ConversationsEvent, ConversationsState> {
//   ConversationsBloc({
//     required this.conversationRepository,
//     required this.chatRepository,
//     required this.userProfileRepository,
//   }) : super(_Initial());
//   final ConversationRepository conversationRepository;
//   final ChatRepository chatRepository;
//   final UserProfileRepository userProfileRepository;

//   StreamSubscription? _conversatonsStream;
//   late final List<StreamSubscription> _chatsItemsStream = [];

//   void init() {
//     if (_conversatonsStream == null) add(_FetchConversation());
//   }

//   void dispose() {
//     add(_Dispose());
//   }

//   void hideConversation(String conversationId) => add(
//         _HideConversation(conversationId),
//       );

//   @override
//   Stream<ConversationsState> mapEventToState(ConversationsEvent event) async* {
//     yield* event.map(
//       fetchConversations: (_) async* {
//         _conversatonsStream =
//             conversationRepository.getAllConversations().listen(
//           (event) {
//             if (event.isNotEmpty) {
//               add(
//                 _FetchChatItems(event),
//               );
//             } else {
//               add(_OnData([]));
//             }
//           },
//           onError: (err) => add(
//             _OnError(),
//           ),
//         );
//       },
//       fetchChatItems: (event) async* {
//         _chatsItemsStream.map((e) => e.cancel());

//         for (var conversation in event.conversations) {
//           if (conversation.timestamp != null) {
//             final chatPersonId = conversation.members.firstWhere(
//                 (element) => element != getIt<FirebaseAuth>().currentUser!.uid);

//             final chatStream = CombineLatestStream.combine3(
//               chatRepository.getLastMessages(conversation.id),
//               userProfileRepository.getUserProfile(chatPersonId),
//               conversationRepository.getUnreadMessagesCount(conversation.id),
//               (
//                 ChatMessageModel lastMessage,
//                 FirebaseUser userProfile,
//                 int unreadCount,
//               ) =>
//                   ConversationItem(
//                 lastMessage: lastMessage,
//                 user: userProfile,
//                 converstaion: conversation,
//                 unreadMessagesCount: unreadCount,
//               ),
//             ).listen(
//               (event) => add(
//                 _OnChatItemsData(event),
//               ),
//               onError: (err) {
//                 print('fetchChatItems $err');
//               },
//             );
//             _chatsItemsStream.add(chatStream);
//           }
//         }
//       },
//       onChatItemsData: (event) async* {
//         yield ConversationsState.loadInProgress();

//         yield state.maybeMap(
//           loadSuccess: (state) {
//             final conversations = state.conversations;
//             conversations.removeWhere((element) =>
//                 element.converstaion.id ==
//                 event.conversationItem.converstaion.id);
//             conversations.add(event.conversationItem);
//             conversations.sort(
//               (b, a) {
//                 return (a.lastMessage.timestamp ?? DateTime.now())
//                     .compareTo((b.lastMessage.timestamp ?? DateTime.now()));
//               },
//             );
//             return ConversationsState.loadSuccess(conversations);
//           },
//           orElse: () =>
//               ConversationsState.loadSuccess([event.conversationItem]),
//         );
//       },
//       onData: (event) async* {
//         yield ConversationsState.loadSuccess(event.conversations);
//       },
//       onError: (_) async* {
//         yield ConversationsState.loadFailure();
//       },
//       dispose: (_) async* {
//         _conversatonsStream?.cancel();
//         _chatsItemsStream.map((e) => e.cancel());
//         _conversatonsStream = null;
//         yield ConversationsState.initial();
//       },
//       hideConversation: (event) async* {
//         yield state.maybeMap(
//           loadSuccess: (state) {
//             var conversations = List.of(state.conversations);
//             conversations.removeWhere(
//               (element) => element.converstaion.id == event.conversationId,
//             );
//             return ConversationsState.loadSuccess(conversations);
//           },
//           orElse: () => state,
//         );
//         conversationRepository.hideConversations(event.conversationId);
//       },
//     );
//   }

//   @override
//   Future<void> close() {
//     _conversatonsStream?.cancel();
//     _chatsItemsStream.map((e) => e.cancel());
//     return super.close();
//   }
// }
