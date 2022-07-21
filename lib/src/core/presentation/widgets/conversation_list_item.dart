import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';

import 'package:neon_chat/neon_chat.dart';
import 'package:neon_chat/src/chat_init.dart';
import 'package:neon_chat/src/core/util/util.dart';

class ConversationListItem extends StatefulWidget {
  final ConversationItem conversationItem;
  final String myId;

  const ConversationListItem({
    Key? key,
    required this.conversationItem,
    required this.myId,
  }) : super(key: key);

  @override
  _ConversationListItemState createState() => _ConversationListItemState();
}

class _ConversationListItemState extends State<ConversationListItem> {
  bool _onHover = false;

  @override
  Widget build(BuildContext context) {
    Widget lastMessageBuilder() {
      if (widget.conversationItem.conversation.isBlockedForMe) {
        return Text(
          _style.conversationBlockedLabel,
          style: _style.conversationBlockedLabelStyle,
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
              style: _style.subtitleTextStyle,
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
          style: _style.subtitleTextStyle,
        );
      } else {
        return const SizedBox.shrink();
      }
    }

    return FocusedMenuHolder(
      duration: const Duration(milliseconds: 200),
      key: Key(widget.conversationItem.conversation.id),
      onPressed: () {},
      menuItemExtent: 45,
      menuOffset: 10.0,
      blurSize: 0.0,
      blurBackgroundColor: _style.focusMenuBlurBackgroundColor,
      menuWidth: MediaQuery.of(context).size.width * 0.6,
      menuBoxDecoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
      menuItems: [
        FocusedMenuItem(
            backgroundColor: _style.focusMenuColor,
            title: SizedBox(
              width: MediaQuery.of(context).size.width * 0.5 - 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(fit: FlexFit.loose, child: _style.focusMenuIcon),
                  Flexible(
                    fit: FlexFit.loose,
                    child: AutoSizeText(
                      _style.focusMenuText,
                      style: _style.focusMenuTextStyle,
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
            openConversationInternally(
              context,
              conversationId: widget.conversationItem.conversation.id,
            );
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
                  ? _style.listTileHoverColor
                  : _style.listTileColor,
            ),
            child: Row(
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: _onTap,
                  child: _conversationThumbnail,
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
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: AutoSizeText(
                              widget.conversationItem.conversation.displayName,
                              maxLines: 2,
                              style: _style.titleTextStyle,
                            ),
                          ),
                          Text(
                            widget.conversationItem.lastMessage !=
                                    ConversationMessage.empty()
                                ? widget.conversationItem.lastMessage
                                    .timestampFormatted
                                : '',
                            style: _style.subtitleTextStyle,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 26,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.65,
                                child: lastMessageBuilder()),
                            if (widget.conversationItem.unreadMessagesCount !=
                                0)
                              Badge(
                                badgeColor: _style.badgeColor,
                                padding: const EdgeInsets.all(6.0),
                                elevation: 0.0,
                                badgeContent: Text(
                                  widget.conversationItem.unreadMessagesCount
                                      .toString(),
                                  style: _style.badgeTextStyle,
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

  ConversationListItemStyle get _style =>
      chatGetIt<ConversationsStyle>().chatListItemStyle;

  void _onTap() {
    final convo = widget.conversationItem.conversation;
    if (convo is DirectConversation) {
      chatGetIt<FunctionInitData>().onDirectConversationAppBarTap?.call(convo);
    } else if (convo is GroupConversation) {
      chatGetIt<FunctionInitData>().onGroupConversationAppBarTap?.call(convo);
    } else {
      throw UnknownConversationType();
    }
  }

  Widget get _conversationThumbnail {
    final convo = widget.conversationItem.conversation;
    if (convo is DirectConversation) {
      return chatGetIt<FunctionInitData>()
              .getUserAvatar
              ?.call(convo.conversationPartner.id) ??
          _defaultConversationImage;
    } else if (convo is GroupConversation) {
      return chatGetIt<FunctionInitData>()
              .getGroupAvatar
              ?.call(convo.thumbnail) ??
          _defaultConversationImage;
    } else {
      throw UnknownConversationType();
    }
  }

  Widget get _defaultConversationImage =>
      AvatarWidget(imgUrl: widget.conversationItem.conversation.thumbnail);
}
