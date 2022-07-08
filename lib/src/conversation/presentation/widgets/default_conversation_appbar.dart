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
    return Builder(
      builder: (context) {
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

          return SubHeader(
            decoration: _style.searchBarDecoration,
            leading: showCloseButton
                ? const Padding(padding: EdgeInsets.symmetric(horizontal: 20))
                : null,
            title: GestureDetector(
              key: const Key('Conversation_Page_Header'),
              behavior: HitTestBehavior.opaque,
              onTap: _onTap,
              child: Row(
                children: [
                  AvatarWidget(imgUrl: conversation.thumbnail),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    height: 40,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          conversation.displayName,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        if (lastActiveAt != null)
                          Text(
                            _style.lastActivityPrefix + lastActiveAt,
                            style: const TextStyle(color: Colors.white54),
                          )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            action: IconButton(
              onPressed: () => context
                  .read<ConversationSearchBloc>()
                  .add(const ConversationSearchEvent.toggleSearch()),
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          );
        } else {
          return ConversationSearchAppBar(
            searchAppBarStyle: _style,
          );
        }
      },
    );
  }

  void _onTap() {
    final convo = conversation;
    if (convo is DirectConversation) {
      chatGetIt<FunctionInitData>().onDirectConversationAppBarTap?.call(convo);
    } else if (convo is GroupConversation) {
      chatGetIt<FunctionInitData>().onGroupConversationAppBarTap?.call(convo);
    } else {
      throw UnknownConversationType();
    }
  }

  SearchAppBarStyle get _style => chatGetIt<SearchAppBarStyle>();

  @override
  Size get preferredSize => const Size.fromHeight(86);
}
