import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:neon_chat/src/conversation/conversation.dart';
import 'package:neon_chat/src/conversation/domain/use_cases/get_upload_url_uc.dart';
import 'package:neon_chat/src/core/core.dart';
import 'package:neon_chat/src/conversations/conversations.dart';

class DefaultConversationLoader extends StatelessWidget {
  final FileUploadRepository fileUploadRepository;
  final ChatBloc Function() chatBloc;
  final ChatSearchBloc Function() chatSearchBloc;

  final ConversationItem conversationItem;
  final bool showCloseButton;

  final ConversationStyle conversationStyle;
  final ChatBubbleStyle chatBubbleStyle;
  final SearchAppBarStyle searchAppBarStyle;
  final BottomBarStyle bottomBarStyle;
  final Function()? onAppbarTap;

  const DefaultConversationLoader({
    Key? key,
    required this.conversationItem,
    required this.fileUploadRepository,
    required this.chatBloc,
    required this.chatSearchBloc,
    required this.conversationStyle,
    required this.chatBubbleStyle,
    required this.searchAppBarStyle,
    required this.bottomBarStyle,
    this.showCloseButton = true,
    this.onAppbarTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ChatBloc>(
          create: (context) => chatBloc()
            ..add(ChatEvent.init(conversationItem: conversationItem)),
        ),
        BlocProvider<ChatSearchBloc>(
          create: (context) => chatSearchBloc(),
        ),
      ],
      child: DefaultConversationPage(
        getUploadUrlUC: GetUploadUrlUC(fileUploadRepository),
        defaultChatBubbleStyle: chatBubbleStyle,
        defaultConversationStyle: conversationStyle,
        defaultSearchAppBarStyle: searchAppBarStyle,
        defaultBottomBarStyle: bottomBarStyle,
        showCloseButton: showCloseButton,
        onAppbarTap: onAppbarTap,
      ),
    );
  }
}
