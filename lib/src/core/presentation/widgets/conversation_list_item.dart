import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';

import 'package:neon_chat/neon_chat.dart';

class ConversationListItem extends StatefulWidget {
  final ConversationItem conversationItem;
  final Function()? onOpenConversation;
  final Function()? onOpenConversationInfo;
  final Widget conversationThumbnail;
  final ConversationListItemStyle conversationListItemStyle;
  final String myId;

  const ConversationListItem({
    Key? key,
    required this.conversationItem,
    required this.myId,
    this.onOpenConversation,
    this.onOpenConversationInfo,
    required this.conversationThumbnail,
    required this.conversationListItemStyle,
  }) : super(key: key);

  @override
  _ConversationListItemState createState() => _ConversationListItemState();
}

class _ConversationListItemState extends State<ConversationListItem> {
  bool _onHover = false;

  @override
  Widget build(BuildContext context) {
    Widget lastMessageBuilder() {
      if (widget.conversationItem.conversation.isBlocked) {
        return Text(
          widget.conversationListItemStyle.conversationBlockedLabel,
          style: widget.conversationListItemStyle.conversationBlockedLabelStyle,
        );
      } else if (widget.conversationItem.lastMessage !=
          ConversationMessage.empty()) {
        final type = widget.conversationItem.lastMessage.type;
        String text = '';
        switch (type) {
          case ConversationMessageType.text:
            return Text(
              widget.conversationItem.lastMessage.text!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: widget.conversationListItemStyle.subtitleTextStyle,
            );
          case ConversationMessageType.image:
            text += '📷  ';
            break;
          case ConversationMessageType.video:
            text += '📹  ';
            break;
          case ConversationMessageType.voice:
            text += '🎤  ';
            break;
          case ConversationMessageType.file:
            text += '📁  ';
            break;
          case ConversationMessageType.deleted:
            break;
          default:
            return const Text('-');
        }
        return Text(
          text + type.displayString,
          style: widget.conversationListItemStyle.subtitleTextStyle,
        );
      } else {
        return const SizedBox.shrink();
      }
    }

    if (widget.conversationItem.lastMessage == ConversationMessage.empty()) {
      return const SizedBox();
    } else {
      return FocusedMenuHolder(
        duration: const Duration(milliseconds: 200),
        key: Key(widget.conversationItem.conversation.id),
        onPressed: () {},
        menuItemExtent: 45,
        menuOffset: 10.0,
        blurSize: 0.0,
        blurBackgroundColor:
            widget.conversationListItemStyle.focusMenuBlurBackgroundColor,
        menuWidth: MediaQuery.of(context).size.width * 0.6,
        menuBoxDecoration:
            BoxDecoration(borderRadius: BorderRadius.circular(50)),
        menuItems: [
          FocusedMenuItem(
              backgroundColor: widget.conversationListItemStyle.focusMenuColor,
              title: SizedBox(
                width: MediaQuery.of(context).size.width * 0.5 - 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                        fit: FlexFit.loose,
                        child: widget.conversationListItemStyle.focusMenuIcon),
                    Flexible(
                      fit: FlexFit.loose,
                      child: AutoSizeText(
                        widget.conversationListItemStyle.focusMenuText,
                        style:
                            widget.conversationListItemStyle.focusMenuTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
              trailingIcon: null,
              onPressed: () => context.read<ConversationsBloc>().add(
                  ConversationsEvent.hideConversation(
                      widget.conversationItem.conversation.id))),
        ],
        child: GestureDetector(
          onTap: () {
            if (isWidthOverLimit(context)) {
              context
                  .read<CurrentConversationCubit>()
                  .onCurrentConversationChanged(
                    widget.conversationItem,
                  );
            } else {
              widget.onOpenConversation?.call();
            }
          },
          child: MouseRegion(
            onEnter: (_) {
              _onHover = true;
              setState(() {});
            },
            onExit: (_) {
              _onHover = false;
              setState(() {});
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              padding: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: (context
                                .watch<CurrentConversationCubit>()
                                .state
                                .conversationItem
                                ?.conversation
                                .id ==
                            widget.conversationItem.conversation.id ||
                        _onHover)
                    ? widget.conversationListItemStyle.listTileHoverColor
                    : widget.conversationListItemStyle.listTileColor,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: widget.onOpenConversationInfo,
                    child: widget.conversationThumbnail,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.conversationItem.conversation
                                  .getDisplayName(widget.myId),
                              style: widget
                                  .conversationListItemStyle.titleTextStyle,
                            ),
                            Text(
                              widget.conversationItem.lastMessage !=
                                      ConversationMessage.empty()
                                  ? widget.conversationItem.lastMessage
                                      .timestampFormatted
                                  : '',
                              style: widget
                                  .conversationListItemStyle.subtitleTextStyle,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 26,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.65,
                                  child: lastMessageBuilder()),
                              if (widget.conversationItem.unreadMessagesCount !=
                                  0)
                                Badge(
                                  badgeColor: widget
                                      .conversationListItemStyle.badgeColor,
                                  padding: const EdgeInsets.all(6.0),
                                  elevation: 0.0,
                                  badgeContent: Text(
                                    widget.conversationItem.unreadMessagesCount
                                        .toString(),
                                    style: widget.conversationListItemStyle
                                        .badgeTextStyle,
                                  ),
                                ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
}
