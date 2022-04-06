import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neon_chat/neon_chat.dart';

class ConversationSearchAppBar extends StatefulWidget {
  final SearchAppBarStyle defaultSearchAppBarStyle;

  const ConversationSearchAppBar({
    Key? key,
    required this.defaultSearchAppBarStyle,
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
      iconColor: widget.defaultSearchAppBarStyle.iconColor,
      decoration: widget.defaultSearchAppBarStyle.searchBarDecoration,
      // show nav Icons for search results
      action: const ChatSearchUpDown(),
      leading: widget.defaultSearchAppBarStyle.leading ??
          IconButton(
            onPressed: () => context
                .read<ConversationSearchBloc>()
                .add(const ConversationSearchEvent.toggleSearch()),
            icon: const Icon(
              Icons.close,
            ),
            color: widget.defaultSearchAppBarStyle.iconColor,
          ),
      title: Expanded(
        child: TextField(
          style: widget.defaultSearchAppBarStyle.searchTextInput,
          cursorColor: widget.defaultSearchAppBarStyle.searchTextCursorColor,
          decoration: widget.defaultSearchAppBarStyle.textFieldDecoration,
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
