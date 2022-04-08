import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neon_chat/neon_chat.dart';

class ConversationSearchAppBar extends StatefulWidget {
  final SearchAppBarStyle searchAppBarStyle;

  const ConversationSearchAppBar({
    Key? key,
    required this.searchAppBarStyle,
  }) : super(key: key);

  @override
  _ConversationSearchAppBarState createState() =>
      _ConversationSearchAppBarState();
}

class _ConversationSearchAppBarState extends State<ConversationSearchAppBar> {
  final _foucsNode = FocusNode();
  @override
  void initState() {
    _foucsNode.requestFocus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SubHeader(
      iconColor: widget.searchAppBarStyle.iconColor,
      decoration: widget.searchAppBarStyle.searchBarDecoration,
      // show nav Icons for search results
      action: const ChatSearchUpDown(),
      leading: widget.searchAppBarStyle.leading ??
          IconButton(
            onPressed: () => context
                .read<ConversationSearchBloc>()
                .add(const ConversationSearchEvent.toggleSearch()),
            icon: const Icon(
              Icons.close,
            ),
            color: widget.searchAppBarStyle.iconColor,
          ),
      title: Expanded(
        child: TextField(
          style: widget.searchAppBarStyle.searchTextInput,
          cursorColor: widget.searchAppBarStyle.searchTextCursorColor,
          decoration: widget.searchAppBarStyle.textFieldDecoration,
          focusNode: _foucsNode,
          onSubmitted: (value) {
            _foucsNode.unfocus();
            context
                .read<ConversationSearchBloc>()
                .add(ConversationSearchEvent.query(value));
          },
        ),
      ),
    );
  }
}
