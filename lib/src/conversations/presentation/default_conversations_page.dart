import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  final Widget Function(String?)? getUserAvatar;

  final ConversationCreationData Function()? getConversationCreationData;

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
    this.getUserAvatar,
    this.getConversationCreationData,
  }) : super(key: key);

  @override
  State<DefaultConversationsPage> createState() =>
      _DefaultConversationsPageState();
}

class _DefaultConversationsPageState extends State<DefaultConversationsPage>
    with AutomaticKeepAliveClientMixin {
  final _scrollController = ScrollController();

  void _openConversation(ConversationItem conversationItem) => openConversation(
        context,
        conversationItem: conversationItem,
        fileUploadRepository: widget.fileUploadRepository,
        generateChatBloc: widget.generateChatBloc,
        generateChatSearchBloc: widget.generateChatSearchBloc,
        searchAppBarStyle: widget.searchAppBarStyle,
        chatBubbleStyle: widget.chatBubbleStyle,
        conversationStyle: widget.conversationStyle,
        bottomBarStyle: widget.bottomBarStyle,
        onAppbarTap: widget.onAppbarTap,
      );

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
                      final convoCreationData =
                          widget.getConversationCreationData?.call();

                      if (convoCreationData != null) {
                        if (convoCreationData
                            is DirectConversationCreationData) {
                          context.read<ConversationsBloc>().add(
                                ConversationsEvent.createConversation(
                                  creationData: convoCreationData,
                                  onSuccessfullyCreatedConversation:
                                      _openConversation,
                                ),
                              );
                        } else if (convoCreationData
                            is GroupConversationCreationData) {
                          context.read<ConversationsBloc>().add(
                                ConversationsEvent.createGroupConversation(
                                  creationData: convoCreationData,
                                  onSuccessfullyCreatedGroupConversation:
                                      _openConversation,
                                ),
                              );
                        }
                      }
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
                        if (loadedConversationsState.conversations.isEmpty) {
                          return [widget.conversationsStyle.emtpyConversation];
                        }
                        return (conversationsSearchState.isSearchActive
                                ? conversationsSearchState.conversations
                                : chatConversations)
                            .map(
                              (conversationItem) => ChatListItem(
                                chatListItemStyle:
                                    widget.conversationsStyle.chatListItemStyle,
                                conversationItem: conversationItem,
                                userAvatar: widget.getUserAvatar?.call(
                                        conversationItem
                                            .conversation.thumbnail) ??
                                    const CircleAvatar(
                                      backgroundColor:
                                          Color.fromARGB(255, 25, 5, 55),
                                      radius: 20.0,
                                    ),
                                onOpenChat: () => openConversation(
                                  context,
                                  conversationItem: conversationItem,
                                  fileUploadRepository:
                                      widget.fileUploadRepository,
                                  generateChatBloc: widget.generateChatBloc,
                                  generateChatSearchBloc:
                                      widget.generateChatSearchBloc,
                                  searchAppBarStyle: widget.searchAppBarStyle,
                                  chatBubbleStyle: widget.chatBubbleStyle,
                                  conversationStyle: widget.conversationStyle,
                                  bottomBarStyle: widget.bottomBarStyle,
                                  onAppbarTap: widget.onAppbarTap,
                                ),
                                onOpenUserProfile: widget.onOpenUserProfile,
                              ),
                            )
                            .toList();
                      },
                      orElse: () => [widget.conversationsStyle.loadingWidget],
                    ),
                  ),
                  loadInProgress: (l) =>
                      widget.conversationsStyle.loadingWidget,
                  orElse: () =>
                      widget.conversationsStyle.emptyConversationsWidget,
                ),
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
