import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neon_chat/neon_chat.dart';
import 'package:neon_chat/src/chat_init.dart';

class DefaultConversationsPage extends StatefulWidget {
  final Function(String, DateTime) updateGroupConversationTimestamp;
  final Function(Conversation)? onOpenUserProfile;
  final Function(Conversation)? onShowGroupInfo;

  final Widget Function(String?)? getUserAvatar;

  final ConversationCreationData Function()? getConversationCreationData;

  const DefaultConversationsPage({
    Key? key,
    required this.updateGroupConversationTimestamp,
    this.onOpenUserProfile,
    this.onShowGroupInfo,
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

  void _openConversation(ConversationItem conversationItem) {
    final timestamp = context
        .read<GroupConversationTimestampsBloc>()
        .getLastSeenTimestampForConversationItem(conversationItem);
    openConversation(
      context,
      conversationItem: conversationItem,
      updateGroupConversationTimestamp: widget.updateGroupConversationTimestamp,
      groupConversationLastSeenTimestamp: timestamp,
      onAppbarTap: widget.onShowGroupInfo,
    );
  }

  @override
  Widget build(BuildContext context) {
    final _myId = chatGetIt<FirebaseAuth>().currentUser!.uid;
    final style = chatGetIt<ConversationsStyle>();
    super.build(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
      child: Scaffold(
        appBar: style.showAppBarAboveConversations
            ? AppBar(
                centerTitle: style.appBarCenterTitle,
                title: style.appBarTitle,
                backgroundColor: style.appBarColor,
              )
            : null,
        floatingActionButton: style.showFab
            ? FloatingActionButton(
                onPressed: style.fabAction ??
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
                backgroundColor: style.fabColor,
                child: style.fabIcon)
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
                          return [style.emptyConversationsWidget];
                        }
                        return (conversationsSearchState.isSearchActive
                                ? conversationsSearchState.conversations
                                : chatConversations)
                            .map(
                              (conversationItem) => ConversationListItem(
                                myId: _myId,
                                conversationListItemStyle:
                                    style.chatListItemStyle,
                                conversationItem: conversationItem,
                                conversationThumbnail: widget.getUserAvatar
                                        ?.call(conversationItem
                                            .conversation.thumbnail) ??
                                    AvatarWidget(
                                        imgUrl: conversationItem
                                            .conversation.thumbnail),
                                onOpenConversation: () => openConversation(
                                  context,
                                  groupConversationLastSeenTimestamp: context
                                      .read<GroupConversationTimestampsBloc>()
                                      .getLastSeenTimestampForConversationItem(
                                          conversationItem),
                                  conversationItem: conversationItem,
                                  updateGroupConversationTimestamp:
                                      widget.updateGroupConversationTimestamp,
                                  onAppbarTap: conversationItem
                                          .conversation.isGroupConversation
                                      ? widget.onShowGroupInfo
                                      : widget.onOpenUserProfile,
                                ),
                                onOpenConversationInfo: conversationItem
                                        .conversation.isGroupConversation
                                    ? () => widget.onShowGroupInfo
                                        ?.call(conversationItem.conversation)
                                    : () => widget.onOpenUserProfile
                                        ?.call(conversationItem.conversation),
                              ),
                            )
                            .toList();
                      },
                      orElse: () => [style.loadingWidget],
                    ),
                  ),
                  loadInProgress: (l) => style.loadingWidget,
                  orElse: () => style.emptyConversationsWidget,
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
