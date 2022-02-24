import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:neon_chat/src/conversation/conversation.dart';
import 'package:neon_chat/src/core/core.dart';
import 'package:neon_chat/src/conversations/conversations.dart';

class DefaultConversationLoader extends StatelessWidget {
  final String conversationId;
  final String userProfileId;
  final bool showCloseButton;
  final FirebaseFirestore firestore;
  final FirebaseAuth firebaseAuth;
  final RemoteDataSource remoteDataSource;
  final FirebaseKeys firebaseKeys;
  const DefaultConversationLoader({
    Key? key,
    required this.userProfileId,
    required this.conversationId,
    required this.firestore,
    required this.firebaseAuth,
    required this.remoteDataSource,
    this.showCloseButton = true,
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
    final conversationsRepository = ConversationsRepositoryImpl(
      firestore: firestore,
      firebaseAuth: firebaseAuth,
      firebaseKeys: firebaseKeys,
    );
    final firebaseUserProfileRepository = FirebaseUserProfileRepositoryImpl(
      firestore: firestore,
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
            sendPlatformFileMessageUC: SendPlatformFileMessageUC(
                conversationRepository: conversationRepository,
                uploadManagerRepository: uploadManagerRepository),
            sendFileMessageUC: SendFileMessageUC(
                conversationRepository: conversationRepository,
                uploadManagerRepository: uploadManagerRepository),
            sendTextMessageUC: SendTextMessageUC(conversationRepository),
            initStreamUC: InitializeConversationStreamUC(
                conversationRepository: conversationRepository,
                conversationsRepository: conversationsRepository,
                firebaseUserProfileRepository: firebaseUserProfileRepository),
          )..add(
              ChatEvent.init(
                  conversationId: conversationId, otherUserId: userProfileId),
            ),
        ),
      ],
      child: DefaultConversationPage(showCloseButton: showCloseButton),
    );
  }
}
