import 'package:auto_route/auto_route.dart';
import 'package:example/router/router.dart';
import 'package:flutter/material.dart';
import 'package:neon_chat/neon_chat.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'HOME!',
            ),
            const SizedBox(height: 12),
            TextButton(
              child: const Text('Chat'),
              onPressed: () => context.router.push(const ChatRoute()),
            ),
            const SizedBox(
              height: 50,
            ),
            TextButton(
              child: const Text('Open Conversation from outside'),
              onPressed: () => openConversation(
                context,
                conversationId: 'yNluhxKbPb3lDKX3KvCO',
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            TextButton(
              child: const Text('Open Conversation From Push'),
              onPressed: () => openConversationFromPushNotification(
                context,
                conversationId: 'yNluhxKbPb3lDKX3KvCO',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
