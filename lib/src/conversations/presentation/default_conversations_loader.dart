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
  final DefaultConverstionsStyle defaultConverstionsStyle;
  final DefaultConversationStyle defaultConversationStyle;
  final DefaultChatBubbleStyle defaultChatBubbleStyle;
  final DefaultSearchAppBarStyle defaultSearchAppBarStyle;
  final DefaultBottomBarStyle defaultBottomBarStyle;

  const DefaultConversationsLoader({
    Key? key,
    required this.firestore,
    required this.firebaseAuth,
    required this.remoteDataSource,
    this.defaultConverstionsStyle = const DefaultConverstionsStyle(),
    this.defaultConversationStyle = const DefaultConversationStyle(),
    this.defaultChatBubbleStyle = const DefaultChatBubbleStyle(),
    this.defaultSearchAppBarStyle = const DefaultSearchAppBarStyle(),
    this.defaultBottomBarStyle = const DefaultBottomBarStyle(),
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
            hideConversationUC: HideConversationUC(conversationsRepository),
            initializeConversationItemStreamUC:
                InitializeConversationItemStreamUC(
                    conversationRepository: conversationRepository,
                    conversationsRepository: conversationsRepository,
                    userProfileRepository: firebaseUserProfileRepository),
            initializeConversationsStreamUC:
                InitializeConversationsStreamUC(conversationsRepository),
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
                        ConversationsSearchEvent.initialize(conversations));
                    final currentConversationCubit =
                        context.read<CurrentConversationCubit>();
                    if (isWidthOverLimit(context) &&
                        currentConversationCubit.state.conversationItem ==
                            null &&
                        conversations.isNotEmpty) {
                      currentConversationCubit
                          .onCurrentConversationChanged(conversations.first);
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
                    defaultConverstionsStyle: defaultConverstionsStyle,
                    defaultConversationStyle: defaultConversationStyle,
                    defaultChatBubbleStyle: defaultChatBubbleStyle,
                    defaultSearchAppBarStyle: defaultSearchAppBarStyle,
                    defaultBottomBarStyle: defaultBottomBarStyle,
                  ),
                ),
                if (isWidthOverLimit(context))
                  BlocBuilder<CurrentConversationCubit,
                      CurrentConversationState>(
                    builder: (context, state) {
                      if (state.conversationItem != null) {
                        return Flexible(
                          child: DefaultConversationLoader(
                            key: Key(state.conversationItem!.conversation.id),
                            defaultChatBubbleStyle: defaultChatBubbleStyle,
                            defaultConversationStyle: defaultConversationStyle,
                            defaultSearchAppBarStyle: defaultSearchAppBarStyle,
                            defaultBottomBarStyle: defaultBottomBarStyle,
                            firebaseAuth: firebaseAuth,
                            firestore: firestore,
                            remoteDataSource: remoteDataSource,
                            conversationItem: state.conversationItem!,
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
