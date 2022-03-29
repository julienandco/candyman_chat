import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:neon_chat/neon_chat.dart';

class MyCustomConversationsPage extends StatelessWidget {
  const MyCustomConversationsPage({Key? key}) : super(key: key);

  dynamic onOpenUserProfile() {
    print('i did not implement this :D');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<ConversationsSearchBloc, ConversationsSearchState>(
          builder: (context, conversationsSearchState) {
            return BlocBuilder<ConversationsBloc, ConversationsState>(
              builder: (context, conversationsState) =>
                  conversationsState.maybeMap(
                loadSuccess: (loadedConversationsState) => ListView(
                  padding: const EdgeInsets.symmetric(vertical: 10),
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
                              defaultChatListItem: DefaultChatListItem(
                                  listTileColor: Colors.grey[200]!),
                              conversationItem: conversation,
                              userAvatar: Container(
                                height: 30,
                                width: 30,
                                color: Colors.green,
                              ),
                              onOpenChat: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => Center(
                                    child: Container(
                                      color: Colors.red,
                                      child: const Text(
                                          'You can build the rest on your own!'),
                                    ),
                                  ),
                                );

                                Future.delayed(const Duration(seconds: 3),
                                    () => Navigator.of(context).pop());
                              },
                              onOpenUserProfile: onOpenUserProfile,
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
}
