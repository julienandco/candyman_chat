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

  final DefaultConversationStyle defaultConversationStyle;
  final DefaultChatBubbleStyle defaultChatBubbleStyle;
  final DefaultSearchAppBarStyle defaultSearchAppBarStyle;
  final DefaultBottomBarStyle defaultBottomBarStyle;
  final Function()? onAppbarTap;

  const DefaultConversationLoader({
    Key? key,
    required this.conversationItem,
    required this.fileUploadRepository,
    required this.chatBloc,
    required this.chatSearchBloc,
    required this.defaultConversationStyle,
    required this.defaultChatBubbleStyle,
    required this.defaultSearchAppBarStyle,
    required this.defaultBottomBarStyle,
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
        defaultChatBubbleStyle: defaultChatBubbleStyle,
        defaultConversationStyle: defaultConversationStyle,
        defaultSearchAppBarStyle: defaultSearchAppBarStyle,
        defaultBottomBarStyle: defaultBottomBarStyle,
        showCloseButton: showCloseButton,
        onAppbarTap: onAppbarTap,
      ),
    );
  }
}
