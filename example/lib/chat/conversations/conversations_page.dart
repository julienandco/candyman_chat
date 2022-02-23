import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neon_chat/neon_chat.dart';

class ConversationsPage extends StatefulWidget {
  const ConversationsPage({Key? key}) : super(key: key);

  @override
  State<ConversationsPage> createState() => _ConversationsPageState();
}

class _ConversationsPageState extends State<ConversationsPage>
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
                            (conversation) =>
                                Text(conversation.conversationPartner.name),
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
