import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neon_chat/neon_chat.dart';
import 'package:neon_chat/src/chat_init.dart';

class DefaultConversationLoader extends StatelessWidget {
  final String conversationId;
  final bool showCloseButton;

  const DefaultConversationLoader({
    Key? key,
    required this.conversationId,
    this.showCloseButton = true,
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
            context.read<ConversationsBloc>().add(
                  ConversationsEvent.setNewTimestampForGroupConversation(
                      conversationId: conversationId, timestamp: timestamp),
                ),
        showCloseButton: showCloseButton,
      ),
    );
  }
}
