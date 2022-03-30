import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neon_chat/neon_chat.dart';

class ChatSearchAppBar extends StatefulWidget {
  final SearchAppBarStyle defaultSearchAppBarStyle;

  const ChatSearchAppBar({
    Key? key,
    required this.defaultSearchAppBarStyle,
  }) : super(key: key);

  @override
  _ChatSearchAppBarState createState() => _ChatSearchAppBarState();
}

class _ChatSearchAppBarState extends State<ChatSearchAppBar> {
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
      decoration: widget.defaultSearchAppBarStyle.serachBarDecoration,
      // show nav Icons for search results
      action: const ChatSearchUpDown(),
      leading: widget.defaultSearchAppBarStyle.leading ??
          IconButton(
            onPressed: () => context
                .read<ChatSearchBloc>()
                .add(const ChatSearchEvent.toggleSearch()),
            icon: const Icon(
              Icons.close,
            ),
            color: widget.defaultSearchAppBarStyle.iconColor,
          ),
      title: Expanded(
        child: TextField(
          style: widget.defaultSearchAppBarStyle.searchTextInput,
          cursorColor: widget.defaultSearchAppBarStyle.searchTextCurserColor,
          decoration: widget.defaultSearchAppBarStyle.textFieldDecoration,
          focusNode: _foucsNode,
          onSubmitted: (value) {
            _foucsNode.unfocus();
            context.read<ChatSearchBloc>().add(ChatSearchEvent.query(value));
          },
        ),
      ),
    );
  }
}
