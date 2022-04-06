import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:neon_chat/neon_chat.dart';
import 'package:neon_chat/src/conversation/domain/use_cases/get_upload_url_uc.dart';

import 'widgets/conversation_appbar_widget.dart';

class DefaultConversationPage extends StatefulWidget {
  final bool showCloseButton;
  final ConversationStyle defaultConversationStyle;
  final MessageBubbleStyle defaultMessageBubbleStyle;
  final SearchAppBarStyle defaultSearchAppBarStyle;
  final BottomBarStyle defaultBottomBarStyle;
  final GetUploadUrlUC getUploadUrlUC;
  final DateTime groupConversationLastSeenTimestamp;
  final Function(DateTime) updateTimestampForConversation;
  final Function(Conversation)? onAppbarTap;

  const DefaultConversationPage({
    Key? key,
    required this.showCloseButton,
    required this.defaultConversationStyle,
    required this.defaultMessageBubbleStyle,
    required this.defaultSearchAppBarStyle,
    required this.defaultBottomBarStyle,
    required this.getUploadUrlUC,
    required this.updateTimestampForConversation,
    required this.groupConversationLastSeenTimestamp,
    this.onAppbarTap,
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
    return BlocConsumer<ConversationBloc, ConversationState>(
      listener: (context, state) {
        state.maybeMap(
          loadSuccess: (state) {
            if (state.messages.isNotEmpty) {
              context.read<ConversationSearchBloc>().add(
                    ConversationSearchEvent.initialize(
                        messages: state.messages,
                        lastSeenMessageTimestamp:
                            widget.groupConversationLastSeenTimestamp),
                  );
            }
          },
          orElse: () {},
        );
      },
      builder: (context, conversationState) => conversationState.maybeMap(
        loadSuccess: (loadedConversationState) =>
            AnnotatedRegion<SystemUiOverlayStyle>(
          value:
              const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
          child: KeyboardDismisser(
            child: Scaffold(
              backgroundColor: widget.defaultConversationStyle.backgroundColor,
              appBar: ConversationAppbar(
                onAvertaTap: widget.onAppbarTap,
                searchAppBarStyle: widget.defaultSearchAppBarStyle,
                showCloseButton: !widget.showCloseButton,
                barDecoration:
                    const BoxDecoration(color: Color.fromARGB(255, 25, 5, 55)),
              ),
              body: Stack(
                children: [
                  CustomScrollView(
                    reverse: true,
                    controller: context
                        .read<ConversationSearchBloc>()
                        .messageListController,
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      SliverPadding(
                        padding:
                            widget.defaultConversationStyle.messageListPadding,
                        sliver: MessageList(
                          updateLastSeenTimestampForConversation: (timestamp) =>
                              widget.updateTimestampForConversation(timestamp),
                          conversationLastSeenTimestamp:
                              widget.groupConversationLastSeenTimestamp,
                          getUploadUrlUC: widget.getUploadUrlUC,
                          defaultChatBubbleStyle:
                              widget.defaultMessageBubbleStyle,
                          getAuthorNameForSenderId: (senderId) {
                            if (loadedConversationState
                                .conversation.isGroupChat) {
                              final author = loadedConversationState
                                  .conversation.conversationMembers
                                  .firstWhere(
                                (member) => member.id == senderId,
                                orElse: () => FirebaseUser(
                                    id: 'dummy', name: 'unknown'), //TODO
                              );
                              return author.name;
                            } else {
                              return loadedConversationState.displayName;
                            }
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
                              colors: widget.defaultConversationStyle
                                  .ignorePointersColors,
                              stops: const [0, 0.15])),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    right: 10,
                    child: SafeArea(
                      child: BlocBuilder<ConversationSearchBloc,
                          ConversationSearchState>(
                        builder: (context, state) {
                          if (state.isSearchActive) {
                            return const SizedBox.shrink();
                          } else {
                            return Padding(
                              padding: isWidthOverLimit(context)
                                  ? const EdgeInsets.only(bottom: 100)
                                  : EdgeInsets.zero,
                              child: BlocBuilder<ConversationBloc,
                                  ConversationState>(
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
        orElse: () => const CircularProgressIndicator(), //TODO
      ),
    );
  }
}
