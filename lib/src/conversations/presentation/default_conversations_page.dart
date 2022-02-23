import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neon_chat/neon_chat.dart';

class DefaultConversationsPage extends StatefulWidget {
  final FirebaseFirestore firestore;
  final FirebaseAuth firebaseAuth;
  final RemoteDataSource remoteDataSource;
  const DefaultConversationsPage({
    Key? key,
    required this.firestore,
    required this.firebaseAuth,
    required this.remoteDataSource,
  }) : super(key: key);

  @override
  State<DefaultConversationsPage> createState() =>
      _DefaultConversationsPageState();
}

class _DefaultConversationsPageState extends State<DefaultConversationsPage>
    with AutomaticKeepAliveClientMixin {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<ConversationsSearchBloc, ConversationsSearchState>(
          builder: (context, conversationsSearchState) {
            return BlocBuilder<ConversationsBloc, ConversationsState>(
              builder: (context, conversationsState) =>
                  conversationsState.maybeMap(
                loadSuccess: (loadedConversationsState) => ListView(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  controller: _scrollController,
                  physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  children: conversationsState.maybeWhen(
                    loadSuccess: (chatConversations) {
                      if (loadedConversationsState.conversations.isEmpty) {
                        return [const Center(child: Text('no conversations'))];
                      }
                      return (conversationsSearchState.isSearchActive
                              ? conversationsSearchState.conversations
                              : chatConversations)
                          .map(
                            (conversation) => ChatListItem(
                              conversationItem: conversation,
                              userAvatar: Container(
                                height: 30,
                                width: 30,
                                color: Colors.green,
                              ),
                              onOpenChat: () {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) =>
                                        DefaultConversationLoader(
                                      firebaseAuth: widget.firebaseAuth,
                                      firestore: widget.firestore,
                                      remoteDataSource: widget.remoteDataSource,
                                      userProfileId:
                                          conversation.conversationPartner.id,
                                      conversationId:
                                          conversation.conversation.id,
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                          .toList();
                    },
                    orElse: () => [
                      const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ],
                  ),
                ),
                orElse: () => Container(),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
