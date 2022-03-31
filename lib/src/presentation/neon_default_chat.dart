import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:neon_chat/src/conversation/conversation.dart';
import 'package:neon_chat/src/conversations/conversations.dart';
import 'package:neon_chat/src/core/core.dart';

///
/// Instance of the NEON-Chat, that works out-of-the-box. Where I come from, we
/// call such things MDMAzing.
///
class NeonChat extends StatelessWidget {
  ///
  /// Get It Instance the Chat heavily relies on. Should be structured as
  /// described in the template shown in README.MD
  ///
  final GetIt getItInstance;

  final ConversationStyle conversationStyle;
  final ConversationsStyle conversationsStyle;
  final ChatBubbleStyle chatBubbleStyle;
  final SearchAppBarStyle searchAppBarStyle;
  final BottomBarStyle bottomBarStyle;

  ///
  /// Gets called when a user wants to start a new 1-on-1 or group chat.
  /// Possible implementation could be: a dialog shows up and lets the user
  /// selected all the wanted conversation partners and returns them as a
  /// [ConversationCreationData] instance.
  ///
  final ConversationCreationData Function()? getConversationCreationData;

  //TODO: function onChatSuccessfully created, default function: opens chat

  ///
  /// Gets called when a user taps on the AppBar within a 1-on-1 Chat.
  /// Useful functionality would be to open the conversation partner's user
  /// profile.
  ///
  /// Default Functionality is nothing, as the app-internal user profile
  /// informations are not dealt with inside the NEON-Chat-Package.
  ///
  final Function()? onOpenUserProfile;

  ///
  /// Gets called when a user taps on the AppBar within a Group Chat.
  /// Default functionality is to open an overview screen that shows the
  /// group's thumbnail, name and all the group members.
  ///
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
    this.getConversationCreationData,
  }) : super(key: key);

  ConversationBloc _generateChatBloc() => ConversationBloc(
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
          create: (context) => getItInstance<ConversationsBloc>()
            ..add(ConversationsEvent.initialize(
                myId: getItInstance<FirebaseAuth>().currentUser!.uid)),
        ),
      ],
      child: DefaultConversationsLoader(
        fileUploadRepository: getItInstance<FileUploadRepository>(),
        generateConversationBloc: _generateChatBloc,
        generateConversationSearchBloc: () => ConversationSearchBloc(),
        conversationStyle: conversationStyle,
        conversationsStyle: conversationsStyle,
        chatBubbleStyle: chatBubbleStyle,
        searchAppBarStyle: searchAppBarStyle,
        bottomBarStyle: bottomBarStyle,
        onAppbarTap: onAppBarTap,
        onOpenUserProfile: onOpenUserProfile,
        getConversationCreationData: getConversationCreationData,
      ),
    );
  }
}
