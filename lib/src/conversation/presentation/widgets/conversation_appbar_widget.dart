import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neon_chat/neon_chat.dart';
import 'package:neon_chat/src/presentation/widgets/avatar_widget.dart';

class ConversationAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  final SearchAppBarStyle defaultSearchAppBarStyle;

  const ConversationAppbar({
    Key? key,
    required this.defaultSearchAppBarStyle,
    required this.showCloseButton,
    required this.barDecoration,
    this.onAvertaTap,
  }) : super(key: key);

  final bool showCloseButton;
  final BoxDecoration barDecoration;
  final Function()? onAvertaTap;
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final chatBloc = context.watch<ConversationBloc>();
        final chatSearchBloc = context.watch<ConversationSearchBloc>();

        if (!chatSearchBloc.state.isSearchActive) {
          final state = chatBloc.state;
          final lastActiveAt = state.mapOrNull(
            loadSuccess: (state) {
              // TODO: setup last active get
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
            decoration: barDecoration,
            leading: showCloseButton
                ? const Padding(padding: EdgeInsets.symmetric(horizontal: 20))
                : null, //Padding(padding: kPadLeftMedium) : null,
            title: GestureDetector(
              key: const Key('Conversation_Page_Header'),
              behavior: HitTestBehavior.opaque,
              onTap: () {
                state.maybeMap(
                  orElse: () {},
                  loadSuccess: (state) => onAvertaTap,
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
                            lastActiveAt,
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
          return ChatSearchAppBar(
            defaultSearchAppBarStyle: defaultSearchAppBarStyle,
          );
        }
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(86);
}
