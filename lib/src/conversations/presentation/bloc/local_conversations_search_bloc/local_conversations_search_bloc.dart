//TODO: delete

// import 'package:bloc/bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:papeo_app/features/chats/domain/entities/conversation_item.dart';

// part 'local_conversations_search_state.dart';
// part 'local_conversations_search_event.dart';
// part 'local_conversations_search_bloc.freezed.dart';

// class LocalConversationsSearchBloc
//     extends Bloc<LocalConversationsSearchEvent, LocalConversationsSearchState> {
//   LocalConversationsSearchBloc() : super(_State(conversations: []));
//   final textController = TextEditingController();
//   List<ConversationItem> _conversations = [];
//   void setEntries(List<ConversationItem> conversations) => add(
//         _SetEntries(conversations),
//       );
//   void searchSwitch(bool value, bool isPartyChat,
//       {bool clearTextController = false}) {
//     if (clearTextController) {
//       textController.clear();
//     }
//     add(
//       _SearchSwitch(value, isPartyChat),
//     );
//   }

//   void query(String term, bool isPartyChat) => add(
//         _Query(term, isPartyChat),
//       );
//   @override
//   Stream<LocalConversationsSearchState> mapEventToState(
//       LocalConversationsSearchEvent event) async* {
//     yield* event.when(
//       setEntirs: (conversations) async* {
//         _conversations = conversations;
//       },
//       searchSwitch: (value, isPartyChat) async* {
//         yield state.copyWith(
//           isSearchActive: value,
//           conversations: value
//               ? (isPartyChat
//                       ? _conversations.where((element) => element.isPartyChat)
//                       : _conversations.where((element) => !element.isPartyChat))
//                   .toList()
//               : [],
//         );
//       },
//       query: (term, isPartyChat) async* {
//         final resulte = <ConversationItem>{};
//         for (int i = 0; i < _conversations.length; i++) {
//           if (isPartyChat && _conversations[i].isPartyChat) {
//             String data = _conversations[i].converstaion.displayName!;
//             String user = _conversations[i].user.name;

//             if (data.toLowerCase().contains(term.toLowerCase())) {
//               resulte.add(_conversations[i]);
//             }
//             if (user.toLowerCase().contains(term.toLowerCase())) {
//               resulte.add(_conversations[i]);
//             }
//           } else if (!isPartyChat && !_conversations[i].isPartyChat) {
//             String data = _conversations[i].user.name;
//             if (data.toLowerCase().contains(term.toLowerCase())) {
//               resulte.add(_conversations[i]);
//             }
//           }
//         }

//         add(_OnResulte(resulte.toList()));
//       },
//       onResulte: (resultes) async* {
//         yield state.copyWith(conversations: resultes, isSearchActive: true);
//       },
//     );
//   }
// }
