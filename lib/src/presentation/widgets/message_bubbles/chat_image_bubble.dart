import 'dart:io';

import 'package:flutter/material.dart';

import 'package:neon_chat/src/conversation/conversation.dart';

class ChatImageBubble extends StatelessWidget {
  // TODO: mplemet style
  final ChatMessage message;
  final double height;
  final Widget Function(String url, Widget placeholder)
      getRedirectedCachedNetworkImage;
  final void Function()? onTap;
  const ChatImageBubble({
    Key? key,
    required this.message,
    this.height = 200,
    this.onTap,
    required this.getRedirectedCachedNetworkImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: height,
        width: MediaQuery.of(context).size.width * 0.5,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: message.upload == null
                ? Image.file(File(message.filePath!))
                : getRedirectedCachedNetworkImage(
                    message.upload!.fileId,
                    Container(),
                  )
            //TODO
            // RedirectedCachedNetworkImage(
            //     url: '$kRemoteUploadsUrl/${message.upload!.fileId}',
            //     placeholder: Container(),
            //   ),
            ),
      ),
    );
  }
}
