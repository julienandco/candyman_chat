import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neon_chat/src/conversation/conversation.dart';
import 'package:neon_chat/src/conversations/conversations.dart';
import 'package:neon_chat/src/core/core.dart';

class DefaultConversationsLoader extends StatelessWidget {
  final FileUploadRepository fileUploadRepository;
  final ChatBloc Function() chatBloc;
  final ChatSearchBloc Function() chatSearchBloc;

  final DefaultConverstionsStyle defaultConverstionsStyle;
  final DefaultConversationStyle defaultConversationStyle;
  final DefaultChatBubbleStyle defaultChatBubbleStyle;
  final DefaultSearchAppBarStyle defaultSearchAppBarStyle;
  final DefaultBottomBarStyle defaultBottomBarStyle;
  final Function()? onOpenUserProfile;
  final Function()? onAppbarTap;

  const DefaultConversationsLoader({
    Key? key,
    required this.fileUploadRepository,
    required this.chatBloc,
    required this.chatSearchBloc,
    this.defaultConverstionsStyle = const DefaultConverstionsStyle(),
    this.defaultConversationStyle = const DefaultConversationStyle(),
    this.defaultChatBubbleStyle = const DefaultChatBubbleStyle(),
    this.defaultSearchAppBarStyle = const DefaultSearchAppBarStyle(),
    this.defaultBottomBarStyle = const DefaultBottomBarStyle(),
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
                    chatBloc: chatBloc,
                    chatSearchBloc: chatSearchBloc,
                    defaultConverstionsStyle: defaultConverstionsStyle,
                    defaultConversationStyle: defaultConversationStyle,
                    defaultChatBubbleStyle: defaultChatBubbleStyle,
                    defaultSearchAppBarStyle: defaultSearchAppBarStyle,
                    defaultBottomBarStyle: defaultBottomBarStyle,
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
                            chatBloc: chatBloc,
                            chatSearchBloc: chatSearchBloc,
                            defaultChatBubbleStyle: defaultChatBubbleStyle,
                            defaultConversationStyle: defaultConversationStyle,
                            defaultSearchAppBarStyle: defaultSearchAppBarStyle,
                            defaultBottomBarStyle: defaultBottomBarStyle,
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
