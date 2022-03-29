import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:neon_chat/neon_chat.dart';
import 'package:neon_chat/src/conversation/domain/use_cases/get_upload_url_uc.dart';

import 'widgets/conversation_appbar_widget.dart';
// import 'package:timeago/timeago.dart' as timeago;

class DefaultConversationPage extends StatefulWidget {
  final bool showCloseButton;
  final DefaultConversationStyle defaultConversationStyle;
  final DefaultChatBubbleStyle defaultChatBubbleStyle;
  final DefaultSearchAppBarStyle defaultSearchAppBarStyle;
  final DefaultBottomBarStyle defaultBottomBarStyle;
  final GetUploadUrlUC getUploadUrlUC;

  const DefaultConversationPage({
    Key? key,
    required this.showCloseButton,
    required this.defaultConversationStyle,
    required this.defaultChatBubbleStyle,
    required this.defaultSearchAppBarStyle,
    required this.defaultBottomBarStyle,
    required this.getUploadUrlUC,
  }) : super(key: key);

  @override
  _DefaultConversationPageState createState() =>
      _DefaultConversationPageState();
}

class _DefaultConversationPageState extends State<DefaultConversationPage> {
  bool _isInit = true;
  // setup push notifications
  // TODO: push notifications services
  // @override
  // void initState() {
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   getIt<PushNotificationService>().enableChatNotifications();
  //   super.dispose();
  // }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      // final id = context.read<ChatBloc>().conversationId;
      // getIt<PushNotificationService>()
      //     .disableChatNotificationsForConversationId(id);
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChatBloc, ChatState>(
      listener: (context, state) {
        state.maybeMap(
          loadSuccess: (state) {
            if (state.messages.isNotEmpty) {
              context.read<ChatSearchBloc>().add(
                    ChatSearchEvent.initialize(state.messages),
                  );
            }
          },
          orElse: () {},
        );
      },
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
        child: KeyboardDismisser(
          child: Scaffold(
            backgroundColor: widget.defaultConversationStyle.backgroundColor,
            appBar: ConversationAppbar(
              defaultSearchAppBarStyle: widget.defaultSearchAppBarStyle,
              showCloseButton: !widget.showCloseButton,
              barDecoration:
                  const BoxDecoration(color: Color.fromARGB(255, 25, 5, 55)),
            ),
            body: Stack(
              children: [
                CustomScrollView(
                  reverse: true,
                  controller:
                      context.read<ChatSearchBloc>().messageListController,
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    SliverPadding(
                      padding:
                          widget.defaultConversationStyle.messageListPadding,
                      sliver: MessageList(
                        getUploadUrlUC: widget.getUploadUrlUC,
                        defaultChatBubbleStyle: widget.defaultChatBubbleStyle,
                        getAuthorNameForSenderId: (senderId) {
                          return context.watch<ChatBloc>().state.maybeMap(
                                orElse: () => 'undefined',
                                loadSuccess: (state) {
                                  if (state.conversation.isGroupChat) {
                                    //TODO: this is wrong, how to get name of other user in group chat?
                                    return 'TODO FÜR GRUPPENCHAT';
                                  } else {
                                    return state.displayName;
                                  }
                                },
                              );
                        },
                      ),
                    ),
                  ],
                ),
                IgnorePointer(
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: widget
                                .defaultConversationStyle.ignorPointersColors,
                            stops: const [0, 0.15])),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  right: 10,
                  child: SafeArea(
                    child: BlocBuilder<ChatSearchBloc, ChatSearchState>(
                      builder: (context, state) {
                        if (state.isSearchActive) {
                          return const SizedBox.shrink();
                        } else {
                          return Padding(
                            padding: isWidthOverLimit(context)
                                ? const EdgeInsets.only(bottom: 100)
                                : EdgeInsets.zero,
                            child: BlocBuilder<ChatBloc, ChatState>(
                              builder: (context, state) {
                                return state.maybeMap(
                                  loadSuccess: (state) {
                                    return ChatBottomBar(
                                      defaultBottomBarStyle:
                                          widget.defaultBottomBarStyle,
                                    );
                                  },
                                  orElse: () => const SizedBox.shrink(),
                                );
                              },
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
