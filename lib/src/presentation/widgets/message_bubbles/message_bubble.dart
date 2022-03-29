import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:neon_chat/src/conversation/domain/use_cases/get_upload_url_uc.dart';
import 'package:neon_chat/src/core/core.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:neon_chat/src/conversation/conversation.dart';
import 'message_widgets/check_mark_widget.dart';
import 'message_widgets/message_content_widget.dart';

class MessageBubble extends StatefulWidget {
  final bool isGroupChat;
  final ChatMessage message;
  final Widget? otherUserAvatar;
  final String otherUserName;
  final DefaultChatBubbleStyle defaultChatBubbleStyle;
  final GetUploadUrlUC getUploadUrlUC;

  const MessageBubble({
    Key? key,
    required this.isGroupChat,
    required this.message,
    this.otherUserAvatar,
    required this.otherUserName,
    required this.defaultChatBubbleStyle,
    required this.getUploadUrlUC,
  }) : super(key: key);

  @override
  _MessageBubbleState createState() => _MessageBubbleState();
}

class _MessageBubbleState extends State<MessageBubble> {
  bool _showAvatar = false;

  @override
  void initState() {
    super.initState();
    _showAvatar = widget.defaultChatBubbleStyle.showAvatar &&
        widget.otherUserAvatar != null &&
        !widget.message.isMe;
  }

  void showDeleteMessageDialog() {
    bool canDeleteMessage = !widget.message.isDeleted && widget.message.isMe;
    if (canDeleteMessage) {
      widget.defaultChatBubbleStyle.onShowDeletionDialog?.call(
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
            maxWidth: MediaQuery.of(context).size.width *
                widget.defaultChatBubbleStyle.maxWidthPercentage);
  }

  void copyToClipboard() async {
    await Clipboard.setData(ClipboardData(text: widget.message.text));
    widget.defaultChatBubbleStyle.onCopyToClipboard?.call();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.message.isMe && !widget.message.doneUpload) {
      return const SizedBox.shrink();
    }
    var footer = [
      Text(
        widget.message.timestampFormatted,
        style: widget.defaultChatBubbleStyle.messageTimestampStyle,
      ),
      if (widget.message.isMe)
        CheckMarkWidget(
          message: widget.message,
          seenIcon: widget.defaultChatBubbleStyle.seenIcon,
          receivedIcon: widget.defaultChatBubbleStyle.receivedIcon,
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
                const SizedBox(width: 5),
                Text(
                  widget.otherUserName,
                  style: widget.defaultChatBubbleStyle.otherUserNameStyle,
                ),
              ],
            ),
          ),
        VisibilityDetector(
          key: Key(widget.message.id),
          onVisibilityChanged: (value) {
            if (!widget.isGroupChat && value.visibleFraction > 0.5) {
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
                FocusedMenuHolder(
                  onPressed: () {},
                  menuItemExtent: 45,
                  menuOffset: 10.0,
                  blurSize: 0.0,
                  bottomOffsetHeight: 100,
                  blurBackgroundColor: Colors.black,
                  menuWidth: MediaQuery.of(context).size.width * 0.6,
                  menuBoxDecoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(50)),
                  menuItems: [
                    for (var i in [1, 2])
                      FocusedMenuItem(
                        backgroundColor: widget.defaultChatBubbleStyle
                            .focusedMenuItemBackgroundColor,
                        title: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5 - 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                fit: FlexFit.loose,
                                child: i == 1
                                    ? widget.defaultChatBubbleStyle.copyIcon ??
                                        const Icon(
                                          Icons.copy,
                                          color: Colors.black,
                                        )
                                    : widget.defaultChatBubbleStyle
                                            .deleteIcon ??
                                        const Icon(Icons.delete,
                                            color: Colors.black),
                              ),
                              Flexible(
                                fit: FlexFit.loose,
                                child: AutoSizeText(
                                  i == 1
                                      ? (widget.defaultChatBubbleStyle
                                              .copyLabel ??
                                          'copy')
                                      : (widget.defaultChatBubbleStyle
                                              .deleteLabel ??
                                          'delete'),
                                  style: widget
                                      .defaultChatBubbleStyle.actionLabelStyle,
                                ),
                              ),
                            ],
                          ),
                        ),
                        trailingIcon: null,
                        onPressed:
                            i == 1 ? copyToClipboard : showDeleteMessageDialog,
                      ),
                  ],
                  child: Container(
                    constraints: _constraints,
                    decoration: widget.defaultChatBubbleStyle.decoration ??
                        BoxDecoration(
                          color: widget.message.isMe
                              ? widget.defaultChatBubbleStyle.ownMessageColor
                              : widget
                                  .defaultChatBubbleStyle.otherUserMessageColor,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(
                                widget.defaultChatBubbleStyle.bubbleradius),
                            bottomLeft: Radius.circular(widget.message.isMe
                                ? widget.defaultChatBubbleStyle.bubbleradius
                                : 0),
                            topLeft: Radius.circular(
                                widget.defaultChatBubbleStyle.bubbleradius),
                            topRight: Radius.circular(widget.message.isMe
                                ? 0
                                : widget.defaultChatBubbleStyle.bubbleradius),
                          ),
                        ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(
                            widget.defaultChatBubbleStyle.bubbleradius),
                        bottomLeft: Radius.circular(widget.message.isMe
                            ? widget.defaultChatBubbleStyle.bubbleradius
                            : 0),
                        topLeft: Radius.circular(
                            widget.defaultChatBubbleStyle.bubbleradius),
                        topRight: Radius.circular(widget.message.isMe
                            ? 0
                            : widget.defaultChatBubbleStyle.bubbleradius),
                      ),
                      child: MessageContentWidget(
                        getUploadUrlUC: widget.getUploadUrlUC,
                        defaultAudioPlayerStyle: widget
                            .defaultChatBubbleStyle.defaultAudioPlayerStyle,
                        defaultVideoPlayerStyle: widget
                            .defaultChatBubbleStyle.defaultVideoPlayerStyle,
                        defaultFileBubbleStyle: widget
                            .defaultChatBubbleStyle.defaultFileBubbleStyle,
                        message: widget.message,
                        footer: footer,
                        messageBubbleDeletedLabel: widget.defaultChatBubbleStyle
                                .messageBubbleDeletedLabel ??
                            'deleted',
                        messageTypeNotSupportedLabel: widget
                                .defaultChatBubbleStyle
                                .messageTypeNotSupportedLabel ??
                            'not supported',
                        messageIsUploadingLabel: widget.defaultChatBubbleStyle
                                .messageIsUploadingLabel ??
                            'uploading...',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
