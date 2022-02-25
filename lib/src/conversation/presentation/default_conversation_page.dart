import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:neon_chat/neon_chat.dart';
// import 'package:timeago/timeago.dart' as timeago;

//TODO: style

class DefaultConversationPage extends StatefulWidget {
  final bool showCloseButton;
  final EdgeInsetsGeometry messageListPadding;
  final EdgeInsetsGeometry serachPadding;
  final List<Color> ignorPointer;
  final Color backgroundColor;

  const DefaultConversationPage({
    Key? key,
    required this.showCloseButton,
    this.messageListPadding = const EdgeInsets.only(top: 20, bottom: 100, left: 20, right: 20),
    this.serachPadding = const EdgeInsets.only(bottom: 10, left: 10, right: 10),
    this.ignorPointer = const [Colors.black38, Colors.transparent],
    this.backgroundColor = Colors.white,
  }) : super(key: key);

  @override
  _DefaultConversationPageState createState() =>
      _DefaultConversationPageState();
}

class _DefaultConversationPageState extends State<DefaultConversationPage> {
  bool _isInit = true;
  //TODO: push notifications services
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
                    ChatSearchEvent.setEntries(state.messages),
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
            backgroundColor: widget.backgroundColor,
            appBar: _Appbar(showCloseButton: !widget.showCloseButton),
            body: Stack(
              children: [
                CustomScrollView(
                  reverse: true,
                  controller:
                      context.read<ChatSearchBloc>().messageListController,
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    SliverPadding(
                      padding: widget.messageListPadding,
                      sliver: MessageList(
                        otherUser: context.watch<ChatBloc>().state.maybeMap(
                              orElse: () => null,
                              loadSuccess: (state) => state.userProfile,
                            ),
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
                            colors: widget.ignorPointer,
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
                                    return const ChatBottomBar();
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
                // The buttons will be visable when the search is active and
                // the results aren't empty
                const ChatSearchUpDown()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Appbar extends StatelessWidget implements PreferredSizeWidget {
  const _Appbar({Key? key, required this.showCloseButton}) : super(key: key);
  final bool showCloseButton;
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final chatBloc = context.watch<ChatBloc>();
        final chatSearchBloc = context.watch<ChatSearchBloc>();

        if (!chatSearchBloc.state.isSearchActive) {
          final state = chatBloc.state;
          final lastActiveAt = state.mapOrNull(
            loadSuccess: (state) {
              //TODO:
              // final timestamp = state.userProfile.lastActiveAt;
              // return timestamp != null
              //     ? timeago.format(
              //         timestamp,
              //         locale:
              //             EasyLocalization.of(context)?.locale.languageCode ??
              //                 'en',
              //       )
              //     : null;
            },
          );
          return SubHeader(
            //TODO
            leading: showCloseButton
                ? const Padding(padding: EdgeInsets.symmetric(horizontal: 20))
                : null, //Padding(padding: kPadLeftMedium) : null,
            title: GestureDetector(
              key: const Key('Conversation_Page_Header'),
              behavior: HitTestBehavior.opaque,
              onTap: () {
                state.maybeMap(
                  orElse: () {},
                  loadSuccess: (state) {
                    //TODO
                    // openUserProfile(
                    //   context,
                    //   state.userProfile.id,
                    //   user: state.userProfile,
                    // );
                  },
                );
              },
              child: Row(
                children: [
                  state.maybeMap(
                    //TODO
                    loadSuccess: (state) =>
                        Container(height: 20, width: 20, color: Colors.green),
                    // UserAvatar(
                    //   user: state.userProfile.isBlocked
                    //       ? null
                    //       : state.userProfile,
                    // ),
                    orElse: () => const SizedBox.shrink(),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.maybeMap(
                          loadSuccess: (state) => state.userProfile.name,
                          orElse: () => '',
                        ),
                        style: const TextStyle(color: Colors.white),
                      ),
                      if (lastActiveAt != null)
                        Text(
                          lastActiveAt,
                          style: const TextStyle(color: Colors.white),
                        )
                    ],
                  ),
                ],
              ),
            ),
            action: IconButton(
              onPressed: () => context
                  .read<ChatSearchBloc>()
                  .add(const ChatSearchEvent.searchSwitch()),
              icon: const Icon(
                CupertinoIcons.search,
                color: Colors.white,
              ),
            ),
          );
        } else {
          return const ChatSearchAppBar(
              iconColor: Colors.white,
              searchTextInput: TextStyle(color: Colors.white),
              searchTextCurserColor: Colors.white,
              textFieldDecoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.white54),
              ));
        }
      },
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(86);
}
