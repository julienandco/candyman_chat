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
  final DefaultAudioPlayerStyle defaultAudioPlayerStyle;
  final DefaultVideoPlayerStyle defaultVideoPlayerStyle;
  final DefaultFileBubbleStyle defaultFileBubbleStyle;
  final GetUploadUrlUC getUploadUrlUC;

  const MessageContentWidget({
    Key? key,
    required this.message,
    required this.footer,
    required this.messageIsUploadingLabel,
    required this.messageBubbleDeletedLabel,
    this.messageBubbleDeletedStyle = const TextStyle(color: Colors.white),
    required this.messageTypeNotSupportedLabel,
    this.messageTypeNotSupportedStyle = const TextStyle(color: Colors.white),
    this.messageTextStyle = const TextStyle(color: Colors.white),
    required this.defaultAudioPlayerStyle,
    required this.defaultVideoPlayerStyle,
    required this.defaultFileBubbleStyle,
    required this.getUploadUrlUC,
  }) : super(key: key);
  final ChatMessage message;
  final List<Widget> footer;

  @override
  Widget build(BuildContext context) {
    return _getMessageContent(context);
  }

  Widget _getMessageContent(BuildContext context) {
    switch (message.type) {
      case ChatMessageType.voice:
        return Container(
          margin: const EdgeInsets.all(15),
          child: Column(
            children: [
              ChatAudioPlayer(
                defaultAudioPlayerStyle: defaultAudioPlayerStyle,
                message: message,
                getUploadUrlUC: getUploadUrlUC,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: footer,
              )
            ],
          ),
        );
      case ChatMessageType.image:
        return Container(
          margin: const EdgeInsets.all(5),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: footer,
                ),
              ),
            ],
          ),
        );
      case ChatMessageType.video:
        return Container(
          width: MediaQuery.of(context).size.width * 0.5,
          margin: const EdgeInsets.all(5),
          child: Column(
            children: [
              if (!message.doneUpload && kIsWeb) Text(messageIsUploadingLabel),
              if (message.doneUpload)
                ChatVideoBubble(
                  defaultVideoPlayerStyle: defaultVideoPlayerStyle,
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: footer,
                ),
              ),
            ],
          ),
        );

      case ChatMessageType.file:
        return Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ChatFileBubble(
                defaultFileBubbleStyle: defaultFileBubbleStyle,
                message: message,
                getUploadUrlUC: getUploadUrlUC,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: footer,
              ),
            ],
          ),
        );
      case ChatMessageType.deleted:
        return Padding(
          padding: const EdgeInsets.all(15),
          child: Text(
            messageBubbleDeletedLabel,
            style: messageBubbleDeletedStyle,
          ),
        );
      default:
        return Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LinkWell(
                message.text ?? messageTypeNotSupportedLabel,
                style: messageTextStyle,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: footer,
              ),
            ],
          ),
        );
    }
  }
}

void _openMediaViewer(
    BuildContext context, ChatMessage message, GetUploadUrlUC getUrl) {
  // TODO: get url from remote data source
  // Navigator.of(context).push(
  //   ChatVideoPage.route(
  //     context,
  //     currentMediaMessage: message,
  //   ),

  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) =>
            ChatVideoPage(message: message, getUploadUrlUC: getUrl)),
  );
}
