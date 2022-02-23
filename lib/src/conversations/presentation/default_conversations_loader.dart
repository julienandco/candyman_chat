import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:neon_chat/src/conversation/conversation.dart';
import 'package:neon_chat/src/conversations/conversations.dart';
import 'package:neon_chat/src/core/core.dart';

class DefaultConversationsLoader extends StatelessWidget {
  final FirebaseFirestore firestore;
  final FirebaseAuth firebaseAuth;
  final RemoteDataSource remoteDataSource;
  final FirebaseKeys firebaseKeys;
  const DefaultConversationsLoader({
    Key? key,
    required this.firestore,
    required this.firebaseAuth,
    required this.remoteDataSource,
    this.firebaseKeys = const FirebaseKeys(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ConversationsSearchBloc(),
        ),
        BlocProvider(
          create: (context) => CurrentConversationCubit(),
        ),
        BlocProvider<ConversationsBloc>(
          create: (context) => ConversationsBloc(
            conversationsRepository: ConversationsRepositoryImpl(
              firestore: firestore,
              firebaseAuth: firebaseAuth,
              firebaseKeys: firebaseKeys,
            ),
            conversationRepository: ConversationRepositoryImpl(
              firestore: firestore,
              firebaseAuth: firebaseAuth,
              firebaseKeys: firebaseKeys,
            ),
            userProfileRepository: FirebaseUserProfileRepositoryImpl(
              firestore: firestore,
              firebaseKeys: firebaseKeys,
            ),
          ),
        ),
      ],
      child: Builder(builder: (context) {
        return MultiBlocListener(
          listeners: [
            BlocListener<ConversationsBloc, ConversationsState>(
              listener: (context, state) {
                state.maybeWhen(
                  loadSuccess: (conversations) {
                    context.read<ConversationsSearchBloc>().add(
                        ConversationsSearchEvent.setEntries(conversations));
                    final currentConversationCubit =
                        context.read<CurrentConversationCubit>();
                    if (isWidthOverLimit(context) &&
                        currentConversationCubit.state.conversationId == null &&
                        conversations.isNotEmpty) {
                      final firstChat = conversations.first;
                      currentConversationCubit.onCurrentConversationChanged(
                          firstChat.conversationPartner.id,
                          firstChat.conversation.id);
                    }
                  },
                  orElse: () {},
                );
              },
            ),
          ],
          child: Scaffold(
            body: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: DefaultConversationsPage(
                    firebaseAuth: firebaseAuth,
                    remoteDataSource: remoteDataSource,
                    firestore: firestore,
                  ),
                ),
                if (isWidthOverLimit(context))
                  BlocBuilder<CurrentConversationCubit,
                      CurrentConversationState>(
                    builder: (context, state) {
                      if (state.conversationId != null) {
                        return Flexible(
                          child:
                              // Text(state.userProfileId ?? 'no user id found'),
                              DefaultConversationLoader(
                            key: Key(state.conversationId!),
                            firebaseAuth: firebaseAuth,
                            firestore: firestore,
                            remoteDataSource: remoteDataSource,
                            userProfileId: state.userProfileId!,
                            conversationId: state.conversationId!,
                            showCloseButton: false,
                          ),
                        );
                      } else {
                        return const Expanded(
                          child: Center(
                            child: Text('chats'),
                          ),
                        );
                      }
                    },
                  )
              ],
            ),
          ),
        );
      }),
    );
  }
}
