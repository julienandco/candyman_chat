import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:neon_chat/src/conversation/conversation.dart';
import 'package:neon_chat/src/conversation/domain/use_cases/get_upload_url_uc.dart';
import 'package:neon_chat/src/core/core.dart';
import 'package:neon_chat/src/conversations/conversations.dart';

class DefaultConversationLoader extends StatelessWidget {
  final ConversationItem conversationItem;
  final bool showCloseButton;
  final FirebaseFirestore firestore;
  final FirebaseAuth firebaseAuth;
  final RemoteDataSource remoteDataSource;
  final FirebaseKeys firebaseKeys;
  final DefaultConversationStyle defaultConversationStyle;
  final DefaultChatBubbleStyle defaultChatBubbleStyle;
  final DefaultSearchAppBarStyle defaultSearchAppBarStyle;
  final DefaultBottomBarStyle defaultBottomBarStyle;
  final Function()? onAppbarTap;

  const DefaultConversationLoader({
    Key? key,
    required this.conversationItem,
    required this.firestore,
    required this.firebaseAuth,
    required this.remoteDataSource,
    required this.defaultConversationStyle,
    required this.defaultChatBubbleStyle,
    required this.defaultSearchAppBarStyle,
    required this.defaultBottomBarStyle,
    this.showCloseButton = true,
    this.onAppbarTap,
    this.firebaseKeys = const FirebaseKeys(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO: get those out of context somehow?
    final conversationRepository = ConversationRepositoryImpl(
      firestore: firestore,
      firebaseAuth: firebaseAuth,
      firebaseKeys: firebaseKeys,
    );

    final fileUploadRepository = FileUploadRepositoryImpl(
      remoteDataSource: remoteDataSource,
    );
    final uploadManagerRepository = UploadManagerRepositoryImpl(
      fileUploadRepository: fileUploadRepository,
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider<ChatSearchBloc>(
          create: (context) => ChatSearchBloc(),
        ),
        BlocProvider<ChatBloc>(
          create: (context) => ChatBloc(
            firebaseAuth: firebaseAuth,
            hideMessageUC: HideMessageUC(conversationRepository),
            deleteMessageUC: DeleteMessageUC(conversationRepository),
            markAsSeenUC: MarkMessageAsSeenUC(conversationRepository),
            markGroupMessageAsSeenUC:
                MarkGroupMessageAsSeenUC(conversationRepository),
            sendPlatformFileMessageUC: SendPlatformFileMessageUC(
                conversationRepository: conversationRepository,
                uploadManagerRepository: uploadManagerRepository),
            sendFileMessageUC: SendFileMessageUC(
                conversationRepository: conversationRepository,
                uploadManagerRepository: uploadManagerRepository),
            sendTextMessageUC: SendTextMessageUC(conversationRepository),
            initStreamUC: InitializeConversationStreamUC(
              conversationRepository: conversationRepository,
            ),
          )..add(
              ChatEvent.init(conversationItem: conversationItem),
            ),
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
