import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:neon_chat/src/conversation/conversation.dart';
import 'package:neon_chat/src/conversations/conversations.dart';
import 'package:neon_chat/src/core/core.dart';

class NeonChat extends StatelessWidget {
  final GetIt getItInstance;

  final ConversationStyle conversationStyle;
  final ConversationsStyle conversationsStyle;
  final ChatBubbleStyle chatBubbleStyle;
  final SearchAppBarStyle searchAppBarStyle;
  final BottomBarStyle bottomBarStyle;

  final Function()? onOpenUserProfile;
  final Function()? onAppBarTap;

  const NeonChat({
    Key? key,
    required this.getItInstance,
    this.conversationStyle = const ConversationStyle(),
    this.conversationsStyle = const ConversationsStyle(),
    this.searchAppBarStyle = const SearchAppBarStyle(),
    this.bottomBarStyle = const BottomBarStyle(),
    this.chatBubbleStyle = const ChatBubbleStyle(),
    this.onAppBarTap,
    this.onOpenUserProfile,
  }) : super(key: key);

  ChatBloc _generateChatBloc() => ChatBloc(
        firebaseAuth: getItInstance<FirebaseAuth>(),
        hideMessageUC: getItInstance<HideMessageUC>(),
        deleteMessageUC: getItInstance<DeleteMessageUC>(),
        markAsSeenUC: getItInstance<MarkMessageAsSeenUC>(),
        markGroupMessageAsSeenUC: getItInstance<MarkGroupMessageAsSeenUC>(),
        sendPlatformFileMessageUC: getItInstance<SendPlatformFileMessageUC>(),
        sendFileMessageUC: getItInstance<SendFileMessageUC>(),
        sendTextMessageUC: getItInstance<SendTextMessageUC>(),
        initStreamUC: getItInstance<InitializeConversationStreamUC>(),
      );

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getItInstance<ConversationsSearchBloc>(),
        ),
        BlocProvider(
          create: (context) => getItInstance<CurrentConversationCubit>(),
        ),
        BlocProvider(
          create: (context) => getItInstance<ConversationsBloc>(),
        ),
      ],
      child: DefaultConversationsLoader(
        fileUploadRepository: getItInstance<FileUploadRepository>(),
        generateChatBloc: _generateChatBloc,
        generateChatSearchBloc: () => ChatSearchBloc(),
        conversationStyle: conversationStyle,
        conversationsStyle: conversationsStyle,
        chatBubbleStyle: chatBubbleStyle,
        searchAppBarStyle: searchAppBarStyle,
        bottomBarStyle: bottomBarStyle,
        onAppbarTap: onAppBarTap,
        onOpenUserProfile: onOpenUserProfile,
      ),
    );
  }
}
