import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neon_chat/src/chat_init.dart';
import 'package:neon_chat/src/conversation/conversation.dart';
import 'package:neon_chat/src/conversations/conversations.dart';
import 'package:neon_chat/src/core/core.dart';

class DefaultConversationsLoader extends StatelessWidget {
  final Function(Conversation)? onOpenUserProfile;
  final Function(Conversation)? onAppbarTap;

  final Widget Function(String?)? getUserAvatar;

  const DefaultConversationsLoader({
    Key? key,
    this.onOpenUserProfile,
    this.onAppbarTap,
    this.getUserAvatar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _myId = chatGetIt<FirebaseAuth>().currentUser!.uid;
    return Builder(
      builder: (context) {
        return MultiBlocListener(
          listeners: [
            BlocListener<GroupConversationTimestampsBloc,
                GroupConversationTimestampsState>(listener: (context, state) {
              state.maybeWhen(
                loaded: ((timestampMap) => context.read<ConversationsBloc>()
                  ..add(ConversationsEvent.initialize(
                      myId: _myId, timestamps: timestampMap))),
                orElse: () {},
              );
            }),
            BlocListener<ConversationsBloc, ConversationsState>(
              listener: (context, state) {
                state.maybeWhen(
                  loadSuccess: (conversations) {
                    context.read<ConversationsSearchBloc>().add(
                        ConversationsSearchEvent.initialize(conversations));
                    final currentConversationCubit =
                        context.read<CurrentConversationCubit>();
                    if (isWidthOverLimit(context) &&
                        currentConversationCubit.state.conversationItem ==
                            null &&
                        conversations.isNotEmpty) {
                      currentConversationCubit
                          .onCurrentConversationChanged(conversations.first);
                    }
                  },
                  orElse: () {},
                );
              },
            ),
          ],
          child: Scaffold(
            body: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: DefaultConversationsPage(
                    onOpenUserProfile: onOpenUserProfile,
                    onShowGroupInfo: onAppbarTap,
                    getUserAvatar: getUserAvatar,
                  ),
                ),
                if (isWidthOverLimit(context))
                  BlocBuilder<CurrentConversationCubit,
                      CurrentConversationState>(
                    builder: (context, state) {
                      if (state.conversationItem != null) {
                        return Flexible(
                          child: DefaultConversationLoader(
                            key: Key(state.conversationItem!.conversation.id),
                            groupConversationLastSeenTimestamp: context
                                .read<GroupConversationTimestampsBloc>()
                                .getLastSeenTimestampForConversationItem(
                                    state.conversationItem!),
                            conversationItem: state.conversationItem!,
                            showCloseButton: false,
                            onAppbarTap: onAppbarTap,
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
