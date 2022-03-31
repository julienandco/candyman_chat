import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:neon_chat/neon_chat.dart';

class DefaultConversationsPage extends StatefulWidget {
  final FileUploadRepository fileUploadRepository;
  final ChatBloc Function() generateChatBloc;
  final ChatSearchBloc Function() generateChatSearchBloc;

  final ConversationsStyle conversationsStyle;
  final ConversationStyle conversationStyle;
  final ChatBubbleStyle chatBubbleStyle;
  final SearchAppBarStyle searchAppBarStyle;
  final BottomBarStyle bottomBarStyle;
  final Function()? onOpenUserProfile;
  final Function()? onAppbarTap;

  const DefaultConversationsPage({
    Key? key,
    required this.fileUploadRepository,
    required this.generateChatBloc,
    required this.generateChatSearchBloc,
    required this.conversationsStyle,
    required this.conversationStyle,
    required this.chatBubbleStyle,
    required this.searchAppBarStyle,
    required this.bottomBarStyle,
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
          centerTitle: widget.conversationsStyle.appBarCenterTitle,
          title: widget.conversationsStyle.appBarTitle,
          backgroundColor: widget.conversationsStyle.appBarColor,
        ),
        floatingActionButton: !widget.conversationsStyle.showFab
            ? FloatingActionButton(
                onPressed: widget.conversationsStyle.fabAction ??
                    () async {
                      print('go');
                      //TODODELETE
                      final convo =
                          await GetIt.instance<ConversationsRepository>()
                              .createConversation(
                        conversationPartner: FirebaseUser(
                          id: 'w4Kx3Rn95eSYoiAvSiqaYGQ7auk1',
                          name: 'Julien5',
                        ),
                        me: FirebaseUser(
                          id: 'tAqmmpKhZecyewN53YmdOseiw2u2',
                          name: 'Julien',
                        ),
                      );
                      final newConversationItem = ConversationItem(
                          conversation: convo,
                          lastMessage: ChatMessage.empty(),
                          unreadMessagesCount: 0);

                      openConversation(
                        context,
                        conversationItem: newConversationItem,
                        fileUploadRepository: widget.fileUploadRepository,
                        generateChatBloc: widget.generateChatBloc,
                        generateChatSearchBloc: widget.generateChatSearchBloc,
                        searchAppBarStyle: widget.searchAppBarStyle,
                        chatBubbleStyle: widget.chatBubbleStyle,
                        conversationStyle: widget.conversationStyle,
                        bottomBarStyle: widget.bottomBarStyle,
                        onAppbarTap: widget.onAppbarTap,
                      );
                      // Placeholder dialog
                      // showDialog(
                      //   context: context,
                      //   builder: (context) => Center(
                      //     child: Container(
                      //       padding: const EdgeInsets.all(16),
                      //       color: widget.defaultConversationsStyle.fabColor,
                      //       child: const Text(
                      //         'START NEW CHAT',
                      //         style: TextStyle(color: Colors.white),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    },
                backgroundColor: widget.conversationsStyle.fabColor,
                child: widget.conversationsStyle.fabIcon)
            : null,
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
                                      widget
                                          .conversationsStyle.emtpyConversation
                                    ];
                                  }
                                  return (conversationsSearchState
                                              .isSearchActive
                                          ? conversationsSearchState
                                              .conversations
                                          : chatConversations)
                                      .map(
                                        (conversation) => ChatListItem(
                                          chatListItemStyle: widget
                                              .conversationsStyle
                                              .chatListItemStyle,
                                          conversationItem: conversation,
                                          userAvatar: const CircleAvatar(
                                            backgroundColor:
                                                Color.fromARGB(255, 25, 5, 55),
                                            radius: 20.0,
                                          ),
                                          onOpenChat: () => openConversation(
                                            context,
                                            conversationItem: conversation,
                                            fileUploadRepository:
                                                widget.fileUploadRepository,
                                            generateChatBloc:
                                                widget.generateChatBloc,
                                            generateChatSearchBloc:
                                                widget.generateChatSearchBloc,
                                            searchAppBarStyle:
                                                widget.searchAppBarStyle,
                                            chatBubbleStyle:
                                                widget.chatBubbleStyle,
                                            conversationStyle:
                                                widget.conversationStyle,
                                            bottomBarStyle:
                                                widget.bottomBarStyle,
                                            onAppbarTap: widget.onAppbarTap,
                                          ),
                                          onOpenUserProfile:
                                              widget.onOpenUserProfile,
                                        ),
                                      )
                                      .toList();
                                },
                                orElse: () =>
                                    [widget.conversationsStyle.loadingWidget],
                              ),
                            ),
                        loadInProgress: (l) =>
                            widget.conversationsStyle.loadingWidget,
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
