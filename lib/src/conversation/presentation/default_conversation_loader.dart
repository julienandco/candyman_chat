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
  const DefaultConversationLoader({
    Key? key,
    required this.userProfileId,
    required this.conversationId,
    required this.firestore,
    required this.firebaseAuth,
    required this.remoteDataSource,
    this.showCloseButton = true,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //TODO
    // final firestore = FirebaseFirestore.instance;
    // final firebaseAuth = FirebaseAuth.instance;
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
              firestore,
              firebaseAuth,
            ),
            conversationsRepository: ConversationsRepositoryImpl(
              firestore,
              firebaseAuth,
            ),
            userProfileRepository: FirebaseUserProfileRepositoryImpl(firestore),
            firebaseAuth: firebaseAuth,
            chatUploadManagerRepository: ChatUploadManagerRepositoryImpl(
              //TODO
              fileUploadRepository: FileUploadRepositoryImpl(
                remoteDataSource: remoteDataSource,
                // deleteEndpoint: (_) async => right('e'),
                // patchEndpoint: (_, __) async => right('e'),
                // postEndpoint: (_, __) async => right('e'),
                // getEndpoint: (_) async => right('e'),
                // uploadFileToPresignedURL: (
                //   String url, {
                //   String? filePath,
                //   PlatformFile? platformFile,
                //   void Function(int, int)? onReceiveProgress,
                // }) async =>
                //     right(const Success()),
              ),
            ),
          ),
        ),
      ],
      child: DefaultConversationPage(showCloseButton: showCloseButton),
    );
  }
}
