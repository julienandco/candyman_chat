import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neon_chat/src/chat_init.dart';
import 'package:neon_chat/src/conversation/conversation.dart';
import 'package:neon_chat/src/conversations/conversations.dart';
import 'package:neon_chat/src/core/core.dart';

class DefaultConversationsLoader extends StatelessWidget {
  const DefaultConversationsLoader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return BlocListener<ConversationsBloc, ConversationsState>(
          listener: (context, state) {
            state.maybeWhen(
              loadSuccess: (conversations, _) {
                context
                    .read<ConversationsSearchBloc>()
                    .add(ConversationsSearchEvent.initialize(conversations));
                final currentConversationCubit =
                    context.read<CurrentConversationCubit>();
                if (isWidthOverLimit(context) &&
                    currentConversationCubit.state.conversationItem == null &&
                    conversations.isNotEmpty) {
                  currentConversationCubit
                      .onCurrentConversationChanged(conversations.first);
                }
              },
              orElse: () {},
            );
          },
          child: Scaffold(
            body: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const DefaultConversationsPage(),
                ),
                if (isWidthOverLimit(context))
                  BlocBuilder<CurrentConversationCubit,
                      CurrentConversationState>(
                    builder: (context, state) {
                      if (state.conversationItem != null) {
                        return Flexible(
                          child: DefaultConversationLoader(
                            key: Key(state.conversationItem!.conversation.id),
                            conversationId:
                                state.conversationItem!.conversation.id,
                            showCloseButton: false,
                          ),
                        );
                      } else {
                        return Expanded(
                          child: Center(
                            child: Text(chatGetIt<ConversationsStyle>()
                                .noConversationsPlaceholderStringWeb),
                          ),
                        );
                      }
                    },
                  )
              ],
            ),
          ),
        );
      },
    );
  }
}
