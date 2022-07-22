import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neon_chat/neon_chat.dart';
import 'package:neon_chat/src/chat_init.dart';

class DefaultConversationAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  final Conversation conversation;
  final bool showCloseButton;

  const DefaultConversationAppbar({
    Key? key,
    required this.conversation,
    required this.showCloseButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final conversationSearchBloc = context.watch<ConversationSearchBloc>();

    if (!conversationSearchBloc.state.isSearchActive) {
      String? lastActiveAt;
      if (conversation is DirectConversation) {
        final timestamp = (conversation as DirectConversation)
            .conversationPartner
            .lastActivity;

        lastActiveAt =
            timestamp != null ? formatLastActiveDateTime(timestamp) : null;
      }

      return Container(
        decoration: _style.searchBarDecoration,
        child: SafeArea(
          child: Row(
            children: [
              if (showCloseButton)
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(
                      CupertinoIcons.chevron_back,
                      color: Colors.white,
                    ),
                  ),
                  onTap: () => context.router.pop(),
                ),
              Expanded(
                child: GestureDetector(
                  key: const Key('Conversation_Page_Header'),
                  behavior: HitTestBehavior.opaque,
                  onTap: _onTap,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 4,
                        child: Row(
                          children: [
                            Flexible(
                                flex: 1,
                                child: AvatarWidget(
                                    imgUrl: conversation.thumbnail)),
                            Flexible(
                              flex: 4,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    AutoSizeText(
                                      conversation.displayName,
                                      style: chatGetIt<ConversationStyle>()
                                          .convoNameStyle,
                                    ),
                                    if (lastActiveAt != null)
                                      Text(
                                        _style.lastActivityPrefix +
                                            lastActiveAt,
                                        style: const TextStyle(
                                            color: Colors.white54),
                                      )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () => context
                                .read<ConversationSearchBloc>()
                                .add(const ConversationSearchEvent
                                    .toggleSearch()),
                            child: const Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return ConversationSearchAppBar(
        searchAppBarStyle: _style,
      );
    }
  }

  void _onTap() {
    final convo = conversation;
    if (convo is DirectConversation) {
      chatGetIt<FunctionInitData>().onDirectConversationAppBarTap?.call(convo);
    } else if (convo is GroupConversation) {
      chatGetIt<FunctionInitData>().onGroupConversationAppBarTap.call(convo);
    } else {
      throw UnknownConversationType();
    }
  }

  SearchAppBarStyle get _style => chatGetIt<SearchAppBarStyle>();

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
