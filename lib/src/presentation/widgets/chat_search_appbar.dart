import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:neon_chat/src/conversation/conversation.dart';
import 'package:neon_chat/src/presentation/presentation.dart';

class ChatSearchAppBar extends StatefulWidget {
  /// leading Icon befor text input
  /// default [Icons.close]
  final Widget? leading;

  /// search text field input decoration
  /// default
  final InputDecoration? textFieldDecoration;

  /// icon Color
  /// default [Colors.white]
  final Color? iconColor;

  /// input text color
  /// default [Colors.white]
  final Color? searchTextCurserColor;

  /// searcht text text style
  /// default
  final TextStyle? searchTextInput;

  const ChatSearchAppBar({
    Key? key,
    this.leading,
    this.textFieldDecoration =
        const InputDecoration(hintText: '...', border: InputBorder.none),
    this.iconColor = Colors.white,
    this.searchTextCurserColor = Colors.white,
    this.searchTextInput = const TextStyle(color: Colors.white),
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
      action: const SizedBox.shrink(),
      leading: widget.leading ??
          IconButton(
            onPressed: () => context
                .read<ChatSearchBloc>()
                .add(const ChatSearchEvent.toggleSearch()),
            icon: const Icon(
              Icons.close,
            ),
            color: widget.iconColor,
          ),
      title: Expanded(
        child: TextField(
          style: widget.searchTextInput,
          cursorColor: widget.searchTextCurserColor,
          decoration: widget.textFieldDecoration,
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
