import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neon_chat/src/chat_init.dart';

import 'package:neon_chat/src/conversation/conversation.dart';
import 'package:neon_chat/src/core/core.dart';
import 'package:neon_chat/src/conversations/conversations.dart';

class DefaultConversationLoader extends StatelessWidget {
  final ConversationItem conversationItem;
  final bool showCloseButton;

  final DateTime groupConversationLastSeenTimestamp;

  final Function(String, DateTime) updateGroupConversationTimestamp;
  final Function(Conversation)? onAppbarTap;

  const DefaultConversationLoader({
    Key? key,
    required this.conversationItem,
    required this.updateGroupConversationTimestamp,
    required this.groupConversationLastSeenTimestamp,
    this.showCloseButton = true,
    this.onAppbarTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ConversationBloc>(
          create: (context) => ConversationBloc(
            conversationItem: conversationItem,
            firebaseAuth: chatGetIt<FirebaseAuth>(),
            hideMessageUC: chatGetIt<HideMessageUC>(),
            deleteMessageUC: chatGetIt<DeleteMessageUC>(),
            markAsSeenUC: chatGetIt<MarkMessageAsSeenUC>(),
            sendPlatformFileMessageUC: chatGetIt<SendPlatformFileMessageUC>(),
            sendFileMessageUC: chatGetIt<SendFileMessageUC>(),
            sendTextMessageUC: chatGetIt<SendTextMessageUC>(),
            initStreamUC: chatGetIt<InitializeConversationStreamUC>(),
          ),
        ),
        BlocProvider<ConversationSearchBloc>(
          create: (context) => ConversationSearchBloc(),
        ),
      ],
      child: DefaultConversationPage(
        updateTimestampForConversation: (timestamp) =>
            updateGroupConversationTimestamp(
                conversationItem.conversation.id, timestamp),
        groupConversationLastSeenTimestamp: groupConversationLastSeenTimestamp,
        showCloseButton: showCloseButton,
        onAppbarTap: onAppbarTap,
      ),
    );
  }
}
