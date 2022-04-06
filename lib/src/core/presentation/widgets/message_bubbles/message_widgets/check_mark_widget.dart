import 'package:flutter/material.dart';
import 'package:neon_chat/neon_chat.dart';

class CheckMarkWidget extends StatelessWidget {
  final ConversationMessage message;
  final Widget? seenIcon;
  final Widget? receivedIcon;

  const CheckMarkWidget({
    Key? key,
    required this.message,
    this.seenIcon = const Icon(
      Icons.done_all,
      size: 10,
    ),
    this.receivedIcon = const Icon(
      Icons.check,
      size: 10,
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: (message.timestamp == null || !message.doneUpload)
          ? Icon(
              Icons.timelapse_outlined,
              color: Colors.grey[400],
              size: 20,
            )
          : (message.seen ? seenIcon : receivedIcon),
    );
  }
}
