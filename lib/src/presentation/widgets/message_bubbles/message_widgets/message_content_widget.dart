import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:flutter_link_previewer/flutter_link_previewer.dart';
import 'package:linkwell/linkwell.dart';
import 'package:neon_chat/neon_chat.dart';
import 'package:neon_chat/src/conversation/domain/use_cases/get_upload_url_uc.dart';

class MessageContentWidget extends StatefulWidget {
  final MessageBubbleStyle messageBubbleStyle;

  final GetUploadUrlUC getUploadUrlUC;
  final ChatMessage message;
  final Widget? header;
  final List<Widget> footer;

  const MessageContentWidget({
    Key? key,
    required this.message,
    required this.header,
    required this.footer,
    required this.messageBubbleStyle,
    required this.getUploadUrlUC,
  }) : super(key: key);

  @override
  State<MessageContentWidget> createState() => _MessageContentWidgetState();
}

class _MessageContentWidgetState extends State<MessageContentWidget> {
  PreviewData? _linkPreviewData;

  @override
  Widget build(BuildContext context) {
    if (widget.header != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.header!,
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
      mainAxisAlignment: widget.footer.length > 1
          ? MainAxisAlignment.spaceBetween
          : MainAxisAlignment.end,
      children: widget.footer,
    );
    switch (widget.message.type) {
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
                audioPlayerStyle: widget.messageBubbleStyle.audioPlayerStyle,
                message: widget.message,
                getUploadUrlUC: widget.getUploadUrlUC,
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
              (!widget.message.doneUpload && kIsWeb)
                  ? Text(widget.messageBubbleStyle.messageIsUploadingLabel)
                  : ChatImageBubble(
                      onTap: () => _openMediaViewer(
                          context, widget.message, widget.getUploadUrlUC),
                      message: widget.message,
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
              if (!widget.message.doneUpload && kIsWeb)
                Text(widget.messageBubbleStyle.messageIsUploadingLabel),
              if (widget.message.doneUpload)
                ChatVideoBubble(
                  defaultVideoPlayerStyle:
                      widget.messageBubbleStyle.videoPlayerStyle,
                  onTap: () => _openMediaViewer(
                      context, widget.message, widget.getUploadUrlUC),
                  message: widget.message,
                  getUploadUrlUC: widget.getUploadUrlUC,
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
                defaultFileBubbleStyle:
                    widget.messageBubbleStyle.fileBubbleStyle,
                message: widget.message,
                getUploadUrlUC: widget.getUploadUrlUC,
              ),
              footerWidget,
            ],
          ),
        );
      case ChatMessageType.deleted:
        return Padding(
          padding: const EdgeInsets.only(bottom: 15, right: 15, left: 15),
          child: Text(
            widget.messageBubbleStyle.messageBubbleDeletedLabel,
            style: widget.messageBubbleStyle.messageBubbleDeletedLabelStyle,
          ),
        );
      default:
        final isURL = widget.message.text == null
            ? false
            : (Uri.tryParse(widget.message.text!)?.isAbsolute ?? false);
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
              // LinkWell(
              if (isURL)
                LinkPreview(
                  width: MediaQuery.of(context).size.width,
                  onPreviewDataFetched: (data) {
                    setState(() {
                      _linkPreviewData = data;
                    });
                  },
                  previewData: _linkPreviewData,
                  openOnPreviewImageTap: true,
                  openOnPreviewTitleTap: true,
                  text: widget.message.text ??
                      widget.messageBubbleStyle.messageTypeNotSupportedLabel,
                  textStyle: widget.message.isMe
                      ? widget.messageBubbleStyle.ownMessageTextStyle
                      : widget.messageBubbleStyle.otherUserMessageTextStyle,
                  linkStyle: widget.messageBubbleStyle.linkTextStyle,
                  metadataTextStyle:
                      widget.messageBubbleStyle.linkPreviewBodyTextStyle,
                  metadataTitleStyle:
                      widget.messageBubbleStyle.linkPreviewTitleTextStyle,
                )
              else
                LinkWell(
                  widget.message.text ??
                      widget.messageBubbleStyle.messageTypeNotSupportedLabel,
                  style: widget.message.isMe
                      ? widget.messageBubbleStyle.ownMessageTextStyle
                      : widget.messageBubbleStyle.otherUserMessageTextStyle,
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
