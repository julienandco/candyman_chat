import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neon_chat/src/conversation/conversation.dart';
import 'package:neon_chat/src/conversations/conversations.dart';
import 'package:neon_chat/src/core/core.dart';

class DefaultConversationsLoader extends StatelessWidget {
  final FileUploadRepository fileUploadRepository;
  final ConversationBloc Function() generateConversationBloc;
  final ConversationSearchBloc Function() generateConversationSearchBloc;

  final String myId;

  final ConversationsStyle conversationsStyle;
  final ConversationStyle conversationStyle;
  final MessageBubbleStyle messageBubbleStyle;
  final SearchAppBarStyle searchAppBarStyle;
  final BottomBarStyle bottomBarStyle;
  final Function(Conversation)? onOpenUserProfile;
  final Function(Conversation)? onAppbarTap;
  final Widget Function(String?)? getUserAvatar;

  final void Function(BuildContext, {required Map<String, DateTime> timestamps})
      initializeConversationsBloc;

  final ConversationCreationData Function()? getConversationCreationData;

  const DefaultConversationsLoader({
    Key? key,
    required this.fileUploadRepository,
    required this.generateConversationBloc,
    required this.generateConversationSearchBloc,
    required this.myId,
    required this.conversationsStyle,
    required this.conversationStyle,
    required this.messageBubbleStyle,
    required this.searchAppBarStyle,
    required this.bottomBarStyle,
    required this.initializeConversationsBloc,
    this.onOpenUserProfile,
    this.onAppbarTap,
    this.getUserAvatar,
    this.getConversationCreationData,
  }) : super(key: key);

  void _updateGroupConversationTimestamp(
    BuildContext context, {
    required String conversationId,
    required DateTime timestamp,
  }) {
    context.read<GroupConversationTimestampsBloc>().add(
        GroupConversationTimestampsEvent.setNewTimestamp(
            conversationId: conversationId, timestamp: timestamp));
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return MultiBlocListener(
          listeners: [
            BlocListener<GroupConversationTimestampsBloc,
                GroupConversationTimestampsState>(listener: (context, state) {
              state.maybeWhen(
                loaded: ((timestampMap) => initializeConversationsBloc(context,
                    timestamps: timestampMap)),
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
                    myId: myId,
                    fileUploadRepository: fileUploadRepository,
                    updateGroupConversationTimestamp: (id, timestamp) =>
                        _updateGroupConversationTimestamp(context,
                            conversationId: id, timestamp: timestamp),
                    generateConversationBloc: generateConversationBloc,
                    generateConversationSearchBloc:
                        generateConversationSearchBloc,
                    conversationsStyle: conversationsStyle,
                    conversationStyle: conversationStyle,
                    messageBubbleStyle: messageBubbleStyle,
                    searchAppBarStyle: searchAppBarStyle,
                    bottomBarStyle: bottomBarStyle,
                    onOpenUserProfile: onOpenUserProfile,
                    onShowGroupInfo: onAppbarTap,
                    getUserAvatar: getUserAvatar,
                    getConversationCreationData: getConversationCreationData,
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
                            updateGroupConversationTimestamp: (id, timestamp) =>
                                _updateGroupConversationTimestamp(context,
                                    conversationId: id, timestamp: timestamp),
                            fileUploadRepository: fileUploadRepository,
                            conversationBloc: generateConversationBloc,
                            groupConversationLastSeenTimestamp: context
                                .read<GroupConversationTimestampsBloc>()
                                .getLastSeenTimestampForConversationItem(
                                    state.conversationItem!),
                            conversationSearchBloc:
                                generateConversationSearchBloc,
                            messageBubbleStyle: messageBubbleStyle,
                            conversationStyle: conversationStyle,
                            searchAppBarStyle: searchAppBarStyle,
                            bottomBarStyle: bottomBarStyle,
                            conversationItem: state.conversationItem!,
                            showCloseButton: false,
                            onAppbarTap: onAppbarTap,
                          ),
                        );
                      } else {
                        return const Expanded(
                          child: Center(
                            child: Text(
                                'Conversations'), //TODO: get text from outside
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
