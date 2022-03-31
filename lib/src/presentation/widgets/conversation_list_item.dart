import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';

import 'package:neon_chat/neon_chat.dart';

class ConversationListItem extends StatefulWidget {
  final ConversationItem conversationItem;
  final Function()? onOpenChat;
  final Function()? onOpenUserProfile;
  final Widget userAvatar;
  final ConversationListItemStyle chatListItemStyle;

  const ConversationListItem({
    Key? key,
    required this.conversationItem,
    this.onOpenChat,
    this.onOpenUserProfile,
    required this.userAvatar,
    required this.chatListItemStyle,
  }) : super(key: key);

  @override
  _ConversationListItemState createState() => _ConversationListItemState();
}

class _ConversationListItemState extends State<ConversationListItem> {
  bool _onHover = false;

  @override
  Widget build(BuildContext context) {
    Widget lastMessageBuilder() {
      // if (widget.conversationItem.conversationPartner.isBlocked) {
      //   return Text(
      //     'chatBlocked'.tr(),
      //     style: kTextChatMessageTime,
      //   );
      // } else
      if (widget.conversationItem.lastMessage != ChatMessage.empty()) {
        final type = widget.conversationItem.lastMessage.type;
        String text = '';
        switch (type) {
          case ChatMessageType.text:
            return Text(
              widget.conversationItem.lastMessage.text!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: widget.chatListItemStyle.subtitleTextStyle,
            );
          case ChatMessageType.image:
            text += '📷  ';
            break;
          case ChatMessageType.video:
            text += '📹  ';
            break;
          case ChatMessageType.voice:
            text += '🎤  ';
            break;
          case ChatMessageType.file:
            text += '📁  ';
            break;
          case ChatMessageType.deleted:
            break;
          default:
            return const Text('-');
        }
        return Text(
          text + type.displayString,
          style: widget.chatListItemStyle.subtitleTextStyle,
        );
      } else {
        return const SizedBox.shrink();
      }
    }

    if (widget.conversationItem.lastMessage == ChatMessage.empty()) {
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
            widget.chatListItemStyle.focusMenuBlurBackgroundColor,
        menuWidth: MediaQuery.of(context).size.width * 0.6,
        menuBoxDecoration:
            BoxDecoration(borderRadius: BorderRadius.circular(50)),
        menuItems: [
          FocusedMenuItem(
              backgroundColor: widget.chatListItemStyle.focusMenuColor,
              title: SizedBox(
                width: MediaQuery.of(context).size.width * 0.5 - 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                        fit: FlexFit.loose,
                        child: widget.chatListItemStyle.focusMenuIcon),
                    Flexible(
                      fit: FlexFit.loose,
                      child: AutoSizeText(
                        widget.chatListItemStyle.focusMenuText,
                        style: widget.chatListItemStyle.focusMenuTextStyle,
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
            //TODO: isWidthOverLimit
            if (isWidthOverLimit(context)) {
              context
                  .read<CurrentConversationCubit>()
                  .onCurrentConversationChanged(
                    widget.conversationItem,
                  );
            } else {
              widget.onOpenChat?.call();
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
                    ? widget.chatListItemStyle.listTileHoverColor
                    : widget.chatListItemStyle.listTileColor,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: widget.onOpenUserProfile,
                    child: widget.userAvatar,
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
                              widget.conversationItem.conversation.displayName,
                              style: widget.chatListItemStyle.titleTextStyle,
                            ),
                            Text(
                              widget.conversationItem.lastMessage !=
                                      ChatMessage.empty()
                                  ? widget.conversationItem.lastMessage
                                      .timestampFormatted
                                  : '',
                              style: widget.chatListItemStyle.subtitleTextStyle,
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
                                  badgeColor:
                                      widget.chatListItemStyle.badgeColor,
                                  padding: const EdgeInsets.all(6.0),
                                  elevation: 0.0,
                                  badgeContent: Text(
                                    widget.conversationItem.unreadMessagesCount
                                        .toString(),
                                    style:
                                        widget.chatListItemStyle.badgeTextStyle,
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
