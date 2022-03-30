import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neon_chat/src/conversation/conversation.dart';
import 'package:neon_chat/src/conversations/conversations.dart';
import 'package:neon_chat/src/core/core.dart';

class DefaultConversationsLoader extends StatelessWidget {
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

  const DefaultConversationsLoader({
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
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return MultiBlocListener(
          listeners: [
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
                    fileUploadRepository: fileUploadRepository,
                    chatBloc: generateChatBloc,
                    chatSearchBloc: generateChatSearchBloc,
                    defaultConverstionsStyle: conversationsStyle,
                    defaultConversationStyle: conversationStyle,
                    defaultChatBubbleStyle: chatBubbleStyle,
                    defaultSearchAppBarStyle: searchAppBarStyle,
                    defaultBottomBarStyle: bottomBarStyle,
                    onOpenUserProfile: onOpenUserProfile,
                    onAppbarTap: onAppbarTap,
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
                            fileUploadRepository: fileUploadRepository,
                            chatBloc: generateChatBloc,
                            chatSearchBloc: generateChatSearchBloc,
                            defaultChatBubbleStyle: chatBubbleStyle,
                            defaultConversationStyle: conversationStyle,
                            defaultSearchAppBarStyle: searchAppBarStyle,
                            defaultBottomBarStyle: bottomBarStyle,
                            conversationItem: state.conversationItem!,
                            showCloseButton: false,
                            onAppbarTap: onAppbarTap,
                          ),
                        );
                      } else {
                        return const Expanded(
                          child: Center(
                            child: Text('chats'),
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
