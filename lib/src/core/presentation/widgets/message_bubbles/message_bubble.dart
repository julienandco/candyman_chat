import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:neon_chat/neon_chat.dart';
import 'package:neon_chat/src/chat_init.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'message_widgets/check_mark_widget.dart';
import 'message_widgets/message_content_widget.dart';

class MessageBubble extends StatefulWidget {
  final bool isGroupChat;
  final DateTime? groupChatLastSeenTimestamp;
  final ConversationMessage message;
  final Widget? otherUserAvatar;
  final String otherUserName;
  final void Function(DateTime) updateLastSeenTimestampForGroupConvo;

  const MessageBubble({
    Key? key,
    required this.isGroupChat,
    required this.message,
    this.otherUserAvatar,
    this.groupChatLastSeenTimestamp,
    required this.otherUserName,
    required this.updateLastSeenTimestampForGroupConvo,
  }) : super(key: key);

  @override
  _MessageBubbleState createState() => _MessageBubbleState();
}

class _MessageBubbleState extends State<MessageBubble> {
  // bool _showAvatar = false;
  bool _hasUpdatedTimestampAlready = false;

  // @override
  // void initState() {
  //   super.initState();
  //   _showAvatar = widget.messageBubbleStyle.showAvatar &&
  //       widget.otherUserAvatar != null &&
  //       !widget.message.isMe;
  // }

  void showDeleteMessageDialog() {
    bool canDeleteMessage = !widget.message.isDeleted && widget.message.isMe;
    if (canDeleteMessage) {
      _style.onShowDeletionDialog?.call(
        () {
          context
              .read<ConversationBloc>()
              .add(ConversationEvent.hideMessage(widget.message));
          context.router.pop();
        },
        () {
          context
              .read<ConversationBloc>()
              .add(ConversationEvent.deleteMessage(widget.message));
          context.router.pop();
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
                MediaQuery.of(context).size.width * _style.maxWidthPercentage);
  }

  void copyToClipboard() async {
    await Clipboard.setData(ClipboardData(text: widget.message.text));
    _style.onCopyToClipboard?.call();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.message.isMe && !widget.message.doneUpload) {
      return const SizedBox.shrink();
    }
    var footer = [
      Text(
        widget.message.timestampFormatted,
        style: widget.message.isMe
            ? _style.ownMessageTimestampStyle
            : _style.otherUserMessageTimestampStyle,
      ),
      if (widget.message.isMe && !_style.hideSeenReceivedIcon)
        CheckMarkWidget(
          message: widget.message,
          seenIcon: _style.seenIcon,
          receivedIcon: _style.receivedIcon,
        )
    ];

    if (!widget.message.isMe) footer = footer.reversed.toList();

    var header = widget.isGroupChat && !widget.message.isMe
        ? Padding(
            padding: const EdgeInsets.only(
              top: 5,
              left: 15,
              right: 15,
              bottom: 5,
            ),
            child: AutoSizeText(
              widget.otherUserName,
              maxLines: 1,
              style: _style.otherUserNameStyle,
            ),
          )
        : null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // if (_showAvatar)
        //   Padding(
        //     padding: const EdgeInsets.only(bottom: 7, left: 5),
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.start,
        //       crossAxisAlignment: CrossAxisAlignment.center,
        //       children: [
        //         widget.otherUserAvatar!,
        //         const SizedBox(width: 5),
        //         Text(
        //           widget.otherUserName,
        //           style: widget.chatBubbleStyle.otherUserNameStyle,
        //         ),
        //       ],
        //     ),
        //   ),
        VisibilityDetector(
          key: Key(widget.message.id),
          onVisibilityChanged: (value) {
            if (!widget.isGroupChat &&
                value.visibleFraction > 0.5 &&
                !widget.message.seen &&
                !widget.message.isMe) {
              context
                  .read<ConversationBloc>()
                  .add(ConversationEvent.markAsSeen(widget.message));
            } else if (widget.isGroupChat &&
                value.visibleFraction > 0.5 &&
                (widget.groupChatLastSeenTimestamp == null ||
                    (!_hasUpdatedTimestampAlready &&
                        widget.message.timestamp != null &&
                        widget.groupChatLastSeenTimestamp!
                            .isBefore(widget.message.timestamp!)))) {
              _hasUpdatedTimestampAlready = true;
              widget.updateLastSeenTimestampForGroupConvo(
                  widget.message.timestamp!);
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
                        backgroundColor: _style.focusedMenuItemBackgroundColor,
                        title: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5 - 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                fit: FlexFit.loose,
                                child: i == 1
                                    ? _style.copyIcon ??
                                        const Icon(
                                          Icons.copy,
                                          color: Colors.black,
                                        )
                                    : _style.deleteIcon ??
                                        const Icon(Icons.delete,
                                            color: Colors.black),
                              ),
                              Flexible(
                                fit: FlexFit.loose,
                                child: AutoSizeText(
                                  i == 1
                                      ? (_style.copyLabel ?? 'copy')
                                      : (_style.deleteLabel ?? 'delete'),
                                  style: _style.actionLabelStyle,
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
                    decoration: _style.decoration ??
                        BoxDecoration(
                          color: widget.message.isMe
                              ? _style.ownMessageColor
                              : _style.otherUserMessageColor,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(_style.bubbleRadius),
                            bottomLeft: Radius.circular(
                                widget.message.isMe ? _style.bubbleRadius : 0),
                            topLeft: Radius.circular(_style.bubbleRadius),
                            topRight: Radius.circular(
                                widget.message.isMe ? 0 : _style.bubbleRadius),
                          ),
                        ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(_style.bubbleRadius),
                        bottomLeft: Radius.circular(
                            widget.message.isMe ? _style.bubbleRadius : 0),
                        topLeft: Radius.circular(_style.bubbleRadius),
                        topRight: Radius.circular(
                            widget.message.isMe ? 0 : _style.bubbleRadius),
                      ),
                      child: MessageContentWidget(
                        messageBubbleStyle: _style,
                        titleForMediaPage: widget.otherUserName,
                        message: widget.message,
                        footer: footer,
                        header: header,
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

  MessageBubbleStyle get _style => chatGetIt<MessageBubbleStyle>();
}
