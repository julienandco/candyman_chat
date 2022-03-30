import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neon_chat/neon_chat.dart';

class DefaultConversationsPage extends StatefulWidget {
  final FileUploadRepository fileUploadRepository;
  final ChatBloc Function() chatBloc;
  final ChatSearchBloc Function() chatSearchBloc;

  final ConversationsStyle defaultConverstionsStyle;
  final ConversationStyle defaultConversationStyle;
  final ChatBubbleStyle defaultChatBubbleStyle;
  final SearchAppBarStyle defaultSearchAppBarStyle;
  final BottomBarStyle defaultBottomBarStyle;
  final Function()? onOpenUserProfile;
  final Function()? onAppbarTap;

  const DefaultConversationsPage({
    Key? key,
    required this.fileUploadRepository,
    required this.chatBloc,
    required this.chatSearchBloc,
    required this.defaultConverstionsStyle,
    required this.defaultConversationStyle,
    required this.defaultChatBubbleStyle,
    required this.defaultSearchAppBarStyle,
    required this.defaultBottomBarStyle,
    this.onOpenUserProfile,
    this.onAppbarTap,
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

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: widget.defaultConverstionsStyle.appBarCenterTitle,
          title: widget.defaultConverstionsStyle.appBarTitle,
          backgroundColor: widget.defaultConverstionsStyle.appBarColor,
        ),
        floatingActionButton: widget.defaultConverstionsStyle.showFab
            ? FloatingActionButton(
                onPressed: () =>
                    widget.defaultConverstionsStyle.fabAction ??
                    // Placeholder dialog
                    showDialog(
                      context: context,
                      builder: (context) => Center(
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          color: widget.defaultConverstionsStyle.fabColor,
                          child: const Text(
                            'START NEW CHAT',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                backgroundColor: widget.defaultConverstionsStyle.fabColor,
                child: widget.defaultConverstionsStyle.fabIcon)
            : null,
        body: SafeArea(
          child: BlocBuilder<ConversationsSearchBloc, ConversationsSearchState>(
            builder: (context, conversationsSearchState) {
              return BlocBuilder<ConversationsBloc, ConversationsState>(
                builder: (context, conversationsState) =>
                    conversationsState.maybeMap(
                        loadSuccess: (loadedConversationsState) {
                          return ListView(
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
                                  ];
                                }
                                return (conversationsSearchState.isSearchActive
                                        ? conversationsSearchState.conversations
                                        : chatConversations)
                                    .map(
                                      (conversation) => ChatListItem(
                                        chatListItemStyle: widget
                                            .defaultConverstionsStyle
                                            .chatListItemStyle,
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
                                                fileUploadRepository:
                                                    widget.fileUploadRepository,
                                                chatBloc: widget.chatBloc,
                                                chatSearchBloc:
                                                    widget.chatSearchBloc,
                                                defaultSearchAppBarStyle: widget
                                                    .defaultSearchAppBarStyle,
                                                defaultChatBubbleStyle: widget
                                                    .defaultChatBubbleStyle,
                                                defaultConversationStyle: widget
                                                    .defaultConversationStyle,
                                                defaultBottomBarStyle: widget
                                                    .defaultBottomBarStyle,
                                                conversationItem: conversation,
                                                onAppbarTap: widget.onAppbarTap,
                                              ),
                                            ),
                                          );
                                        },
                                        onOpenUserProfile:
                                            widget.onOpenUserProfile,
                                      ),
                                    )
                                    .toList();
                              },
                              orElse: () => [
                                widget.defaultConverstionsStyle.loadingWidget
                              ],
                            ),
                          );
                        },
                        loadInProgress: (l) =>
                            widget.defaultConverstionsStyle.loadingWidget,
                        orElse: () => const Center(
                              child: Text('No Conversations found!'),
                            )),
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
