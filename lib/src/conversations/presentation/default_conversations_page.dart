import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neon_chat/neon_chat.dart';
import 'package:neon_chat/src/chat_init.dart';

class DefaultConversationsPage extends StatefulWidget {
  const DefaultConversationsPage({Key? key}) : super(key: key);

  @override
  State<DefaultConversationsPage> createState() =>
      _DefaultConversationsPageState();
}

class _DefaultConversationsPageState extends State<DefaultConversationsPage>
    with AutomaticKeepAliveClientMixin {
  final _scrollController = ScrollController();

  void _openConversation(ConversationItem conversationItem) {
    openConversation(
      context,
      conversationId: conversationItem.conversation.id,
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
                      final convoCreationData = chatGetIt<FunctionInitData>()
                          .getConversationCreationData
                          ?.call();

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
                          return [style.noConversationsWidget];
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
                                  conversationThumbnail:
                                      //TODO: should this function rather handle a user id?
                                      chatGetIt<FunctionInitData>()
                                              .getUserAvatar
                                              ?.call(conversationItem
                                                  .conversation.thumbnail) ??
                                          AvatarWidget(
                                              imgUrl: conversationItem
                                                  .conversation.thumbnail),
                                  onOpenConversation: () =>
                                      _openConversation(conversationItem),
                                  onOpenConversationInfo: conversationItem
                                          .conversation.isGroupConversation
                                      ? () => chatGetIt<FunctionInitData>()
                                          .onGroupConversationAppBarTap
                                          ?.call(conversationItem.conversation)
                                      : () => chatGetIt<FunctionInitData>()
                                          .onDirectConversationAppBarTap
                                          ?.call(
                                              conversationItem.conversation)),
                            )
                            .toList();
                      },
                      orElse: () => [style.loadingWidget],
                    ),
                  ),
                  loadInProgress: (l) => style.loadingWidget,
                  orElse: () => style.noConversationsWidget,
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
