import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:linkwell/linkwell.dart';
import 'package:neon_chat/src/core/core.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'package:neon_chat/src/presentation/presentation.dart';
import 'package:neon_chat/src/conversation/conversation.dart';

class MessageBubble extends StatefulWidget {
  final double maxWidthPercentage;
  final ChatMessage message;
  final bool showAvatar;
  final Widget? otherUserAvatar;
  final String otherUserName;
  final TextStyle? otherUserNameStyle;
  final TextStyle? messageTimestampStyle;
  final Color focusedMenuItemBackgroundColor;
  final Widget? copyIcon;
  final Widget? deleteIcon;
  final String? copyLabel;
  final String? deleteLabel;
  final TextStyle? actionLabelStyle;
  final Color ownMessageColor;
  final Color otherUserMessageColor;
  final BoxDecoration? decoration;
  final Widget? seenIcon;
  final Widget? receivedIcon;
  final String? messageIsUploadingLabel;
  final String? messageBubbleDeletedLabel;
  final String? messageTypeNotSupportedLabel;
  final double bubbleradius;

  final void Function()? onCopyToClipboard;
  final void Function(
          void Function() onDeleteForMe, void Function() onDeleteForAll)?
      onShowDeletionDialog;

  const MessageBubble({
    Key? key,
    this.maxWidthPercentage = 2 / 3,
    required this.message,
    this.otherUserAvatar,
    required this.otherUserName,
    this.otherUserNameStyle,
    this.showAvatar = false,
    this.onCopyToClipboard,
    this.onShowDeletionDialog,
    this.messageTimestampStyle = const TextStyle(color: Colors.white54),
    this.focusedMenuItemBackgroundColor = Colors.black87,
    this.copyIcon,
    this.deleteIcon,
    this.copyLabel,
    this.deleteLabel,
    this.actionLabelStyle = const TextStyle(color: Colors.white),
    this.ownMessageColor = Colors.deepPurple,
    this.otherUserMessageColor = Colors.grey,
    this.decoration,
    this.seenIcon,
    this.receivedIcon,
    this.messageIsUploadingLabel,
    this.messageBubbleDeletedLabel,
    this.messageTypeNotSupportedLabel,
    this.bubbleradius = 16.0,
  }) : super(key: key);

  @override
  _MessageBubbleState createState() => _MessageBubbleState();
}

class _MessageBubbleState extends State<MessageBubble> {
  bool _showAvatar = false;

  @override
  void initState() {
    super.initState();
    _showAvatar = widget.showAvatar &&
        widget.otherUserAvatar != null &&
        !widget.message.isMe;
  }

  void showDeleteMessageDialog() {
    bool canDeleteMessage = !widget.message.isDeleted && widget.message.isMe;
    if (canDeleteMessage) {
      widget.onShowDeletionDialog?.call(
        () {
          context.read<ChatBloc>().add(ChatEvent.hideMessage(widget.message));
          Navigator.pop(context);
        },
        () {
          context.read<ChatBloc>().add(ChatEvent.deleteMessage(widget.message));
          Navigator.pop(context);
        },
      );
    }
  }

  AlignmentGeometry get _alignment =>
      widget.message.isMe ? Alignment.centerRight : Alignment.centerLeft;

  MainAxisAlignment get _mainAxisAlignment =>
      widget.message.isMe ? MainAxisAlignment.end : MainAxisAlignment.start;
  BoxConstraints? get _constraints {
    return isWidthOverLimit(context)
        ? const BoxConstraints(maxWidth: 250)
        : BoxConstraints(
            maxWidth:
                MediaQuery.of(context).size.width * widget.maxWidthPercentage,
          );
  }

  void copyToClipboard() async {
    await Clipboard.setData(ClipboardData(text: widget.message.text));
    widget.onCopyToClipboard?.call();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.message.isMe && !widget.message.doneUpload) {
      return const SizedBox.shrink();
    }
    var footer = [
      Text(
        widget.message.timestampFormated,
        style: widget.messageTimestampStyle,
      ),
      if (widget.message.isMe)
        _CheckMark(
          message: widget.message,
          seenIcon: widget.seenIcon,
          receivedIcon: widget.receivedIcon,
        )
    ];
    if (!widget.message.isMe) footer = footer.reversed.toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (_showAvatar)
          Padding(
            padding: const EdgeInsets.only(bottom: 7, left: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                widget.otherUserAvatar!,
                const SizedBox(
                  width: 5,
                ),
                Text(
                  widget.otherUserName,
                  style: widget.otherUserNameStyle,
                ),
              ],
            ),
          ),
        FocusedMenuHolder(
          onPressed: () {},
          menuItemExtent: 45,
          menuOffset: 10.0,
          blurSize: 0.0,
          blurBackgroundColor: Colors.black,
          menuWidth: MediaQuery.of(context).size.width * 0.6,
          menuBoxDecoration:
              BoxDecoration(borderRadius: BorderRadius.circular(50)),
          menuItems: [
            for (var i in [1, 2])
              FocusedMenuItem(
                backgroundColor: widget.focusedMenuItemBackgroundColor,
                title: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5 - 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        fit: FlexFit.loose,
                        child: i == 1
                            ? widget.copyIcon ??
                                const Icon(
                                  Icons.copy,
                                  color: Colors.white30,
                                )
                            : widget.deleteIcon ??
                                const Icon(
                                  Icons.delete,
                                  color: Colors.white30,
                                ),
                      ),
                      Flexible(
                        fit: FlexFit.loose,
                        child: AutoSizeText(
                          i == 1
                              ? (widget.copyLabel ?? 'copy')
                              : (widget.deleteLabel ?? 'delete'),
                          style: widget.actionLabelStyle,
                        ),
                      ),
                    ],
                  ),
                ),
                trailingIcon: null,
                onPressed: i == 1 ? copyToClipboard : showDeleteMessageDialog,
              ),
          ],
          child: VisibilityDetector(
            key: Key(widget.message.id),
            onVisibilityChanged: (value) {
              if (value.visibleFraction > 0.5) {
                context
                    .read<ChatBloc>()
                    .add(ChatEvent.markAsSeen(widget.message));
              }
            },
            child: Align(
              alignment: _alignment,
              child: Row(
                mainAxisAlignment: _mainAxisAlignment,
                children: [
                  Container(
                    constraints: _constraints,
                    decoration: widget.decoration ??
                        BoxDecoration(
                          color: widget.message.isMe
                              ? widget.ownMessageColor
                              : widget.otherUserMessageColor,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(widget.bubbleradius),
                            bottomLeft: Radius.circular(
                                widget.message.isMe ? widget.bubbleradius : 0),
                            topLeft: Radius.circular(widget.bubbleradius),
                            topRight: Radius.circular(
                                widget.message.isMe ? 0 : widget.bubbleradius),
                          ),
                        ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(widget.bubbleradius),
                        bottomLeft: Radius.circular(
                            widget.message.isMe ? widget.bubbleradius : 0),
                        topLeft: Radius.circular(widget.bubbleradius),
                        topRight: Radius.circular(
                            widget.message.isMe ? 0 : widget.bubbleradius),
                      ),
                      child: _MessageContent(
                        message: widget.message,
                        footer: footer,
                        messageBubbleDeletedLabel:
                            widget.messageBubbleDeletedLabel ?? 'deleted',
                        messageTypeNotSupportedLabel:
                            widget.messageTypeNotSupportedLabel ??
                                'not supported',
                        messageIsUploadingLabel:
                            widget.messageIsUploadingLabel ?? 'uploading...',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

void _openMediaViewer(
  BuildContext context,
  ChatMessage message,
) {
  //TODO
  // Navigator.of(context).push(
  //   ChatMediaViewerPage.route(
  //     context,
  //     currentMediaMessage: message,
  //   ),
  // );
}

class _MessageContent extends StatelessWidget {
  final String messageIsUploadingLabel;
  final String messageBubbleDeletedLabel;
  final TextStyle? messageBubbleDeletedStyle;
  final String messageTypeNotSupportedLabel;
  final TextStyle? messageTypeNotSupportedStyle;
  final TextStyle? messageTextStyle;
  const _MessageContent({
    Key? key,
    required this.message,
    required this.footer,
    required this.messageIsUploadingLabel,
    required this.messageBubbleDeletedLabel,
    this.messageBubbleDeletedStyle = const TextStyle(color: Colors.white),
    required this.messageTypeNotSupportedLabel,
    this.messageTypeNotSupportedStyle = const TextStyle(color: Colors.white),
    this.messageTextStyle = const TextStyle(color: Colors.white),
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
                message: message,
                //TODO
                getUploadURL: (e) => e,
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
                      onTap: () => _openMediaViewer(context, message),
                      message: message,
                      //TODO:
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
                  onTap: () => _openMediaViewer(context, message),
                  message: message,
                  //TODO:
                  getUploadURL: (e) => e,
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
                message: message,
                //TODO:
                getUploadURL: (e) => e,
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

class _CheckMark extends StatelessWidget {
  const _CheckMark({
    Key? key,
    required this.message,
    this.seenIcon = const Icon(
      Icons.done_all, //TODO
      size: 10,
    ),
    this.receivedIcon = const Icon(
      Icons.check,
      size: 10,
    ),
  }) : super(key: key);
  final ChatMessage message;
  final Widget? seenIcon;
  final Widget? receivedIcon;
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
