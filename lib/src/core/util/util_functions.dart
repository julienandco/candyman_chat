import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart'
    show TargetPlatform, defaultTargetPlatform, kIsWeb;
import 'package:intl/intl.dart';

import 'package:neon_chat/neon_chat.dart';

bool get isWebOrMacOS =>
    kIsWeb || defaultTargetPlatform == TargetPlatform.macOS;

const kMaxWidth = 800.0;
bool isWidthOverLimit(BuildContext context) =>
    MediaQuery.of(context).size.width > kMaxWidth;

// TODO: get correct locale, not hardcoded de, maybe insert into chatDatastructure?
String formatDatetime(DateTime? date) =>
    DateFormat('HH:mm').format(date ?? DateTime.now());

void openConversation(
  BuildContext context, {
  required ConversationItem conversationItem,
  required FileUploadRepository fileUploadRepository,
  required ConversationBloc Function() generateConversationBloc,
  required ConversationSearchBloc Function() generateConversationSearchBloc,
  SearchAppBarStyle searchAppBarStyle = const SearchAppBarStyle(),
  MessageBubbleStyle chatBubbleStyle = const MessageBubbleStyle(),
  ConversationStyle conversationStyle = const ConversationStyle(),
  BottomBarStyle bottomBarStyle = const BottomBarStyle(),
  Function()? onAppbarTap,
  bool showCloseButton = true,
}) {
  Navigator.push(
    context,
    CupertinoPageRoute(
      builder: (context) => DefaultConversationLoader(
        fileUploadRepository: fileUploadRepository,
        conversationBloc: generateConversationBloc,
        conversationSearchBloc: generateConversationSearchBloc,
        searchAppBarStyle: searchAppBarStyle,
        chatBubbleStyle: chatBubbleStyle,
        conversationStyle: conversationStyle,
        bottomBarStyle: bottomBarStyle,
        conversationItem: conversationItem,
        onAppbarTap: onAppbarTap,
        showCloseButton: showCloseButton,
      ),
    ),
  );
}
