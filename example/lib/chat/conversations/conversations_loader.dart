import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neon_chat/neon_chat.dart';

import 'conversations_page.dart';

class ConversationsLoader extends StatelessWidget {
  const ConversationsLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firestore = FirebaseFirestore.instance;
    final firebaseAuth = FirebaseAuth.instance;
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
              firestore,
              firebaseAuth,
            ),
            conversationRepository: ConversationRepositoryImpl(
              firestore,
              firebaseAuth,
            ),
            userProfileRepository: FirebaseUserProfileRepositoryImpl(firestore),
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
                    if (MediaQuery.of(context).size.width > 800.0 &&
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
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      Column(
                        children: const [
                          // Container(
                          //   // decoration: BoxDecoration(
                          //   //   color: kColorPrimary,
                          //   //   boxShadow: kShadowMedium,
                          //   //   borderRadius: BorderRadius.only(
                          //   //     bottomLeft: kRadiusMedium,
                          //   //     bottomRight: kRadiusMedium,
                          //   //   ),
                          //   // ),
                          //   child: SafeArea(
                          //     bottom: false,
                          //     child: Container(
                          //         padding: kPadHorLarge,
                          //         child: _Tabbar(
                          //           tabController: _tabController,
                          //         )),
                          //   ),
                          // ),
                          Expanded(
                            child: ConversationsPage(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                if (MediaQuery.of(context).size.width > 800.0)
                  BlocBuilder<CurrentConversationCubit,
                      CurrentConversationState>(
                    builder: (context, state) {
                      if (state.conversationId != null) {
                        return Flexible(
                          child:
                              Text(state.userProfileId ?? 'no user id found'),
                          // ChatLoader(
                          //   key: Key(state.conversationId!),
                          //   userProfileId: state.userProfileId!,
                          //   conversationId: state.conversationId!,
                          //   showCloseButton: false,
                          // ),
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
