import 'package:bloc/bloc.dart';
// import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:woozy_search/woozy_search.dart';

import 'package:neon_chat/src/conversation/conversation.dart';

part 'chat_search_state.dart';
part 'chat_search_event.dart';
part 'chat_search_bloc.freezed.dart';

class ChatSearchBloc extends Bloc<ChatSearchEvent, ChatSearchState> {
  ChatSearchBloc() : super(const _State(messageIndices: [])) {
    on<ChatSearchEvent>((event, emit) {
      event.when(
        setEntries: (messages) {
          _messages = messages;
          woozy.setEntries([]);
          for (int index = 0; index < _messages.length; index++) {
            if (_messages[index].type == ChatMessageType.text) {
              woozy.addEntry(
                _messages[index].text!,
                value: {
                  "index": index,
                  'timestamp': _messages[index].timestamp ?? DateTime.now(),
                },
              );
            }
          }
        },
        searchSwitch: () => emit(
          state.copyWith(
            isSearchActive: !state.isSearchActive,
            messageIndices: [],
          ),
        ),
        query: (term) {
          final query = woozy.search(term)
            ..sort(
              (b, a) => (a.value['timestamp'] as DateTime).compareTo(
                b.value['timestamp'] as DateTime,
              ),
            );
          final result = <int>[];
          for (var i in query) {
            if (i.score > 0.66) {
              result.add(i.value['index'] as int);
            }
          }
          emit(state.copyWith(
            messageIndices: result,
            currentResultIndex: 0,
          ));
          if (result.isNotEmpty) {
            _jumpToResult();
          } else {
            //TODO: get rid of fluttertoast dependency and add function showOnNoResults
            Fluttertoast.showToast(
              //TODO: how to get strings? internal in package?
              msg: 'noResults', //.tr(),
              //TODO: how to get styling? probably from outside
              backgroundColor: Colors.red,
              // backgroundColor: kColorPrimaryLighter,
            );
          }
          // add(_OnResulte(result));
        },
        onResult: (messagesIndexes) {
          //TODO: unnecessary event?
          // emit(state.copyWith(
          //   messagesIndexes: messagesIndexes,
          //   currentResulteIndex: 0,
          // ));
          // if (messagesIndexes.isNotEmpty) {
          //   _jumpToResulte();
          // } else {
          //   Fluttertoast.showToast(
          //     msg: 'noResults'.tr(),
          //     backgroundColor: kColorPrimaryLighter,
          //   );
          // }
        },
        onGoResultUp: () {
          if (state.canGoResultUp) {
            emit(state.copyWith(
              currentResultIndex: (state.currentResultIndex) + 1,
            ));
            _jumpToResult();
          }
        },
        onGoResultDown: () {
          if (state.canGoResultDown) {
            emit(state.copyWith(
              currentResultIndex: (state.currentResultIndex) - 1,
            ));
            _jumpToResult();
          }
        },
      );
    });
  }
  final woozy = Woozy();
  final messageListController = AutoScrollController();
  List<ChatMessage> _messages = [];
  // void setEntries(List<ChatMessage> messages) => add(
  //       _SetEntries(messages),
  //     );
  // void searchSwitch() => add(
  //       _SearchSwitch(),
  //     );
  // void query(String term) => add(
  //       _Query(term),
  //     );
  // void onGoResulteUp() => add(_OnGoResulteUp());

  // void onGoResulteDown() => add(_OnGoResulteDown());

  void _jumpToResult() {
    messageListController.scrollToIndex(
      state.messageIndices[state.currentResultIndex],
      preferPosition: AutoScrollPosition.end,
    );
  }

  // @override
  // Stream<ChatSearchState> mapEventToState(ChatSearchEvent event) async* {
  //   yield* event.when(
  //     setEntirs: (messages) async* {
  //       _messages = messages;
  //       woozy.setEntries([]);
  //       for (int index = 0; index < _messages.length; index++) {
  //         if (_messages[index].type == ChatMessageType.text) {
  //           woozy.addEntry(
  //             _messages[index].text!,
  //             value: {
  //               "index": index,
  //               'timestamp': _messages[index].timestamp ?? DateTime.now(),
  //             },
  //           );
  //         }
  //       }
  //     },
  //     searchSwitch: () async* {
  //       yield state.copyWith(
  //         isSearchActive: !state.isSearchActive,
  //         messagesIndexes: [],
  //       );
  //     },
  //     query: (term) async* {
  //       final query = woozy.search(term)
  //         ..sort(
  //           (b, a) => (a.value['timestamp'] as DateTime).compareTo(
  //             b.value['timestamp'] as DateTime,
  //           ),
  //         );
  //       final resulte = <int>[];
  //       for (var i in query) {
  //         if (i.score > 0.66) {
  //           resulte.add(i.value['index'] as int);
  //         }
  //       }
  //       add(_OnResulte(resulte));
  //     },
  //     onResulte: (messagesIndexes) async* {
  //       emit(state.copyWith(
  //         messagesIndexes: messagesIndexes,
  //         currentResulteIndex: 0,
  //       ));
  //       if (messagesIndexes.isNotEmpty) {
  //         _jumpToResulte();
  //       } else {
  //         Fluttertoast.showToast(
  //           msg: 'noResults'.tr(),
  //           backgroundColor: kColorPrimaryLighter,
  //         );
  //       }
  //     },
  //     onGoResulteUp: () async* {
  //       emit(state.copyWith(
  //         currentResulteIndex: (state.currentResulteIndex) + 1,
  //       ));
  //       _jumpToResulte();
  //     },
  //     onGoResulteDown: () async* {
  //       emit(state.copyWith(
  //         currentResulteIndex: (state.currentResulteIndex) - 1,
  //       ));
  //       _jumpToResulte();
  //     },
  //   );
  // }
}
