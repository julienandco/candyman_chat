import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neon_chat/neon_chat.dart';

// TODO: style
// TODO: Implement start/create new - singel/groupe chat
class DefaultConversationsPage extends StatefulWidget {
  final FirebaseFirestore firestore;
  final FirebaseAuth firebaseAuth;
  final RemoteDataSource remoteDataSource;
  final DefaultConverstionsStyle defaultConverstionsStyle;
  final DefaultConversationSyle defaultConversationSyle;
  final DefaultChatBubbleStyle defaultChatBubbleStyle;
  final DefaultSearchAppBarStyle defaultSearchAppBarStyle;
  final DefaultBottomBarStyle defaultBottomBarStyle;

  const DefaultConversationsPage(
      {Key? key,
      required this.firestore,
      required this.firebaseAuth,
      required this.remoteDataSource,
      required this.defaultConverstionsStyle,
      required this.defaultConversationSyle,
      required this.defaultChatBubbleStyle,
      required this.defaultSearchAppBarStyle,
      required this.defaultBottomBarStyle})
      : super(key: key);

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

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
      child: Scaffold(
        appBar: AppBar(
          title: widget.defaultConverstionsStyle.appBarTitle,
          backgroundColor: widget.defaultConverstionsStyle.appBarColor,
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () =>
                // widget.defaultConverstionsStyle.fabAction,
                showDialog(
                  context: context,
                  builder: (context) => Center(
                    child: Container(
                      color: widget.defaultConverstionsStyle.fabColor,
                      child: const Text(
                        'START NEW CHAT',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
            backgroundColor: widget.defaultConverstionsStyle.fabColor,
            child: widget.defaultConverstionsStyle.fabIcon),
        body: SafeArea(
          child: BlocBuilder<ConversationsSearchBloc, ConversationsSearchState>(
            builder: (context, conversationsSearchState) {
              return BlocBuilder<ConversationsBloc, ConversationsState>(
                builder: (context, conversationsState) =>
                    conversationsState.maybeMap(
                        loadSuccess: (loadedConversationsState) => ListView(
                              controller: _scrollController,
                              physics: const BouncingScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics(),
                              ),
                              children: conversationsState.maybeWhen(
                                loadSuccess: (chatConversations) {
                                  if (loadedConversationsState
                                      .conversations.isEmpty) {
                                    return [
                                      widget.defaultConverstionsStyle
                                          .emtpyConversation
                                      // const Center(child: Text('no conversations'))
                                    ];
                                  }
                                  return (conversationsSearchState
                                              .isSearchActive
                                          ? conversationsSearchState
                                              .conversations
                                          : chatConversations)
                                      .map(
                                        (conversation) => ChatListItem(
                                          defaultCahtListItem:
                                              DefaultChatListItem(
                                                  listTileColor:
                                                      Colors.grey[200]!),
                                          conversationItem: conversation,
                                          userAvatar: const CircleAvatar(
                                            backgroundColor:
                                                Color.fromARGB(255, 25, 5, 55),
                                            radius: 20.0,
                                          ),
                                          onOpenChat: () {
                                            Navigator.push(
                                              context,
                                              CupertinoPageRoute(
                                                builder: (context) =>
                                                    DefaultConversationLoader(
                                                  defaultSearchAppBarStyle: widget
                                                      .defaultSearchAppBarStyle,
                                                  defaultChatBubbleStyle: widget
                                                      .defaultChatBubbleStyle,
                                                  defaultConversationSyle: widget
                                                      .defaultConversationSyle,
                                                  defaultBottomBarStyle: widget
                                                      .defaultBottomBarStyle,
                                                  firebaseAuth:
                                                      widget.firebaseAuth,
                                                  firestore: widget.firestore,
                                                  remoteDataSource:
                                                      widget.remoteDataSource,
                                                  userProfileId: conversation
                                                      .conversationPartner.id,
                                                  conversationId: conversation
                                                      .conversation.id,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      )
                                      .toList();
                                },
                                orElse: () => [
                                  widget.defaultConverstionsStyle.loadingWidget
                                ],
                              ),
                            ),
                        orElse: () =>
                            widget.defaultConverstionsStyle.loadingWidget),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
