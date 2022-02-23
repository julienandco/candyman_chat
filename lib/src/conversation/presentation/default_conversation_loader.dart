import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:neon_chat/src/conversation/conversation.dart';
import 'package:neon_chat/src/core/core.dart';
import '../../conversations/conversations.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider<ChatSearchBloc>(
          create: (context) => ChatSearchBloc(),
        ),
        BlocProvider<ChatBloc>(
          create: (context) => ChatBloc(
            userProfileId: userProfileId,
            conversationId: conversationId,
            conversationRepository: ConversationRepositoryImpl(
              firestore: firestore,
              firebaseAuth: firebaseAuth,
              firebaseKeys: firebaseKeys,
            ),
            conversationsRepository: ConversationsRepositoryImpl(
              firestore: firestore,
              firebaseAuth: firebaseAuth,
              firebaseKeys: firebaseKeys,
            ),
            userProfileRepository: FirebaseUserProfileRepositoryImpl(
              firestore: firestore,
              firebaseKeys: firebaseKeys,
            ),
            firebaseAuth: firebaseAuth,
            chatUploadManagerRepository: ChatUploadManagerRepositoryImpl(
              fileUploadRepository: FileUploadRepositoryImpl(
                remoteDataSource: remoteDataSource,
              ),
            ),
          ),
        ),
      ],
      child: DefaultConversationPage(showCloseButton: showCloseButton),
    );
  }
}
