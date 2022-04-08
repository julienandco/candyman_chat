import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neon_chat/neon_chat.dart';

class ConversationAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  final SearchAppBarStyle searchAppBarStyle;
  final bool showCloseButton;
  final Function(Conversation)? onAvertaTap;

  const ConversationAppbar({
    Key? key,
    required this.searchAppBarStyle,
    required this.showCloseButton,
    this.onAvertaTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final me = FirebaseAuth.instance.currentUser;
    return Builder(
      builder: (context) {
        final conversationBloc = context.watch<ConversationBloc>();
        final conversationSearchBloc = context.watch<ConversationSearchBloc>();

        if (!conversationSearchBloc.state.isSearchActive) {
          final state = conversationBloc.state;
          final lastActiveAt = state.mapOrNull(
            loadSuccess: (state) {
              final timestamp = state.conversation.isGroupConversation
                  ? null
                  : state.conversation
                      .getConversationPartner(me?.uid)
                      ?.lastActivity;

              return timestamp != null
                  ? formatLastActiveDateTime(timestamp)
                  : null;
            },
          );
          return SubHeader(
            decoration: searchAppBarStyle.searchBarDecoration,
            leading: showCloseButton
                ? const Padding(padding: EdgeInsets.symmetric(horizontal: 20))
                : null,
            title: GestureDetector(
              key: const Key('Conversation_Page_Header'),
              behavior: HitTestBehavior.opaque,
              onTap: () {
                state.maybeMap(
                  orElse: () {},
                  loadSuccess: (state) => onAvertaTap?.call(state.conversation),
                );
              },
              child: Row(
                children: [
                  state.maybeMap(
                    loadSuccess: (state) =>
                        AvatarWidget(imgUrl: state.conversation.thumbnail),
                    orElse: () => const SizedBox.shrink(),
                  ),
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
                          state.maybeMap(
                            loadSuccess: (state) => state.displayName,
                            orElse: () => '',
                          ),
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        if (lastActiveAt != null)
                          Text(
                            searchAppBarStyle.lastActivityPrefix + lastActiveAt,
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
            searchAppBarStyle: searchAppBarStyle,
          );
        }
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(86);
}
