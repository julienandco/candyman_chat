import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:neon_chat/src/conversation/conversation.dart';
import 'package:neon_chat/src/presentation/presentation.dart';

class ChatSearchAppBar extends StatefulWidget {
  final Widget? leading;
  final InputDecoration? textFieldDecoration;
  const ChatSearchAppBar({
    Key? key,
    this.leading,
    this.textFieldDecoration,
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
                .add(const ChatSearchEvent.searchSwitch()),
            icon: const Icon(
              Icons.close,
            ),
            color: Colors.white,
          ),
      title: Expanded(
        child: TextField(
          decoration: widget.textFieldDecoration ??
              const InputDecoration(
                hintText: 'Search',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent, width: 1),
                ),
              ),
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
