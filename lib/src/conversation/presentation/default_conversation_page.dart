import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:neon_chat/neon_chat.dart';
import 'package:neon_chat/src/chat_init.dart';

class DefaultConversationPage extends StatefulWidget {
  final bool showCloseButton;

  final Function(DateTime) updateTimestampForConversation;

  const DefaultConversationPage({
    Key? key,
    required this.showCloseButton,
    required this.updateTimestampForConversation,
  }) : super(key: key);

  @override
  _DefaultConversationPageState createState() =>
      _DefaultConversationPageState();
}

class _DefaultConversationPageState extends State<DefaultConversationPage> {
  DateTime? _lastSeenGroupConversationTimestamp;
  bool _isInit = true;

  @override
  void dispose() {
    chatGetIt<PushNotificationService>().enableChatNotifications();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final id = context.read<ConversationBloc>().convoId;
      chatGetIt<PushNotificationService>()
          .disableChatNotificationsForConversationId(id);

      _lastSeenGroupConversationTimestamp = context
          .read<ConversationsBloc>()
          .state
          .maybeWhen(
              loadSuccess: (_, timestamps) => timestamps[id],
              orElse: () => null);
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
                            _lastSeenGroupConversationTimestamp),
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
              backgroundColor: chatGetIt<ConversationStyle>().backgroundColor,
              appBar: chatGetIt<ConversationStyle>()
                      .buildCustomConversationAppBar
                      ?.call(loadedConversationState.conversation) ??
                  DefaultConversationAppbar(
                    conversation: loadedConversationState.conversation,
                    showCloseButton: widget.showCloseButton,
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
                            chatGetIt<ConversationStyle>().messageListPadding,
                        sliver: MessageList(
                          updateLastSeenTimestampForConversation: (timestamp) =>
                              widget.updateTimestampForConversation(timestamp),
                          conversation: loadedConversationState.conversation,
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
                              colors: chatGetIt<ConversationStyle>()
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
                                      final bottomBarStyle =
                                          chatGetIt<BottomBarStyle>();

                                      return bottomBarStyle.customBottomBar ??
                                          ConversationBottomBar(
                                              bottomBarStyle: bottomBarStyle);
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
        orElse: () => Scaffold(
            backgroundColor: chatGetIt<ConversationStyle>().backgroundColor,
            body: chatGetIt<ConversationsStyle>().loadingWidget),
      ),
    );
  }
}
