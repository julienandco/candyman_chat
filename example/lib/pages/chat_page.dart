import 'package:flutter/material.dart';
import 'package:neon_chat/neon_chat.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: NeonChat(
        provideConversationsBloc: true,
      ),
    );
  }
}
