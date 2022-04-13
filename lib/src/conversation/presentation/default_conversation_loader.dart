import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neon_chat/src/chat_init.dart';

import 'package:neon_chat/src/conversation/conversation.dart';
import 'package:neon_chat/src/conversations/conversations.dart';
import 'package:neon_chat/src/core/core.dart';

class DefaultConversationLoader extends StatelessWidget {
  final String conversationId;
  final bool showCloseButton;

  final Function(Conversation)? onAppbarTap;

  const DefaultConversationLoader({
    Key? key,
    required this.conversationId,
    this.showCloseButton = true,
    this.onAppbarTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ConversationBloc>(
          create: (context) => ConversationBloc(
            convoId: conversationId,
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
            context.read<GroupConversationTimestampsBloc>().add(
                  GroupConversationTimestampsEvent.setNewTimestamp(
                      conversationId: conversationId, timestamp: timestamp),
                ),
        showCloseButton: showCloseButton,
        onAppbarTap: onAppbarTap,
      ),
    );
  }
}
