import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:linkwell/linkwell.dart';
import 'package:neon_chat/neon_chat.dart';
import 'package:neon_chat/src/conversation/domain/use_cases/get_upload_url_uc.dart';

class MessageContentWidget extends StatelessWidget {
  final String messageIsUploadingLabel;
  final String messageBubbleDeletedLabel;
  final TextStyle? messageBubbleDeletedStyle;
  final String messageTypeNotSupportedLabel;
  final TextStyle? messageTypeNotSupportedStyle;
  final TextStyle? messageTextStyle;
  final AudioPlayerStyle audioPlayerStyle;
  final VideoPlayerStyle videoPlayerStyle;
  final FileBubbleStyle fileBubbleStyle;
  final GetUploadUrlUC getUploadUrlUC;
  final ChatMessage message;
  final Widget? header;
  final List<Widget> footer;

  const MessageContentWidget({
    Key? key,
    required this.message,
    required this.header,
    required this.footer,
    required this.messageIsUploadingLabel,
    required this.messageBubbleDeletedLabel,
    this.messageBubbleDeletedStyle = const TextStyle(color: Colors.white),
    required this.messageTypeNotSupportedLabel,
    this.messageTypeNotSupportedStyle = const TextStyle(color: Colors.white),
    this.messageTextStyle = const TextStyle(color: Colors.white),
    required this.audioPlayerStyle,
    required this.videoPlayerStyle,
    required this.fileBubbleStyle,
    required this.getUploadUrlUC,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (header != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          header!,
          _getMessageContent(context),
        ],
      );
    } else {
      return _getMessageContent(context);
    }
  }

  Widget _getMessageContent(BuildContext context) {
    final footerWidget = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: footer.length > 1
          ? MainAxisAlignment.spaceBetween
          : MainAxisAlignment.end,
      children: footer,
    );
    switch (message.type) {
      case ChatMessageType.voice:
        return Container(
          margin: const EdgeInsets.only(
            bottom: 15,
            right: 15,
            left: 15,
          ),
          child: Column(
            children: [
              ChatAudioPlayer(
                audioPlayerStyle: audioPlayerStyle,
                message: message,
                getUploadUrlUC: getUploadUrlUC,
              ),
              footerWidget,
            ],
          ),
        );
      case ChatMessageType.image:
        return Container(
          margin: const EdgeInsets.only(bottom: 5, right: 5, left: 5),
          width: MediaQuery.of(context).size.width * 0.5,
          child: Column(
            children: [
              (!message.doneUpload && kIsWeb)
                  ? Text(messageIsUploadingLabel)
                  : ChatImageBubble(
                      onTap: () =>
                          _openMediaViewer(context, message, getUploadUrlUC),
                      message: message,
                      // TODO:
                      getRedirectedCachedNetworkImage: (u, p) => Container(),
                    ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 15,
                ),
                child: footerWidget,
              ),
            ],
          ),
        );
      case ChatMessageType.video:
        return Container(
          width: MediaQuery.of(context).size.width * 0.5,
          margin: const EdgeInsets.only(bottom: 5, right: 5, left: 5),
          child: Column(
            children: [
              if (!message.doneUpload && kIsWeb) Text(messageIsUploadingLabel),
              if (message.doneUpload)
                ChatVideoBubble(
                  defaultVideoPlayerStyle: videoPlayerStyle,
                  onTap: () =>
                      _openMediaViewer(context, message, getUploadUrlUC),
                  message: message,
                  getUploadUrlUC: getUploadUrlUC,
                ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 15,
                ),
                child: footerWidget,
              ),
            ],
          ),
        );

      case ChatMessageType.file:
        return Padding(
          padding: const EdgeInsets.only(bottom: 15, right: 15, left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ChatFileBubble(
                defaultFileBubbleStyle: fileBubbleStyle,
                message: message,
                getUploadUrlUC: getUploadUrlUC,
              ),
              footerWidget,
            ],
          ),
        );
      case ChatMessageType.deleted:
        return Padding(
          padding: const EdgeInsets.only(bottom: 15, right: 15, left: 15),
          child: Text(
            messageBubbleDeletedLabel,
            style: messageBubbleDeletedStyle,
          ),
        );
      default:
        return Padding(
          padding: const EdgeInsets.only(
            bottom: 15,
            right: 15,
            left: 15,
            top: 5,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LinkWell(
                message.text ?? messageTypeNotSupportedLabel,
                style: messageTextStyle,
              ),
              footerWidget,
            ],
          ),
        );
    }
  }
}

void _openMediaViewer(
    BuildContext context, ChatMessage message, GetUploadUrlUC getUrl) {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) =>
            ChatVideoPage(message: message, getUploadUrlUC: getUrl)),
  );
}
