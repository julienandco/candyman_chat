import 'package:flutter/cupertino.dart';
import 'package:neon_chat/neon_chat.dart';

const kMaxWidth = 800.0;
bool isWidthOverLimit(BuildContext context) =>
    MediaQuery.of(context).size.width > kMaxWidth;

void openConversation(
  BuildContext context, {
  required ConversationItem conversationItem,
  required FileUploadRepository fileUploadRepository,
  required ChatBloc Function() generateChatBloc,
  required ChatSearchBloc Function() generateChatSearchBloc,
  SearchAppBarStyle searchAppBarStyle = const SearchAppBarStyle(),
  ChatBubbleStyle chatBubbleStyle = const ChatBubbleStyle(),
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
        chatBloc: generateChatBloc,
        chatSearchBloc: generateChatSearchBloc,
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
