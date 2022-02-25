import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';

import 'package:neon_chat/neon_chat.dart';

class ChatListItem extends StatefulWidget {
  const ChatListItem({
    Key? key,
    required this.conversationItem,
    this.onOpenChat,
    this.onOpenUserProfile,
    required this.userAvatar,
  }) : super(key: key);

  final ConversationItem conversationItem;
  final Function()? onOpenChat;
  final Function()? onOpenUserProfile;
  final Widget userAvatar;

  @override
  _ChatListItemState createState() => _ChatListItemState();
}

class _ChatListItemState extends State<ChatListItem> {
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
            return const Text(
                // TODO
                'unknown');
        }
        return Text(text + type.displayString);
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
        blurBackgroundColor: Colors.black, // TODO
        menuWidth: MediaQuery.of(context).size.width * 0.6,
        menuBoxDecoration:
            BoxDecoration(borderRadius: BorderRadius.circular(50)),
        menuItems: [
          FocusedMenuItem(
              // TODO
              // backgroundColor: kColorPrimary,
              title: SizedBox(
                width: MediaQuery.of(context).size.width * 0.5 - 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Flexible(
                        fit: FlexFit.loose,
                        //TODO
                        child: Icon(
                          CupertinoIcons.trash,
                          color: Colors.red,
                        )),
                    Flexible(
                      fit: FlexFit.loose,
                      child: AutoSizeText(
                          //TODO
                          'delete'),
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
                    widget.conversationItem.conversationPartner.id,
                    widget.conversationItem.conversation.id,
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
              //TODO: style
              padding: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: (context
                                .watch<CurrentConversationCubit>()
                                .state
                                .conversationId ==
                            widget.conversationItem.conversation.id ||
                        _onHover)
                    ? Colors.blueAccent
                    : Colors.grey,
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
                    children: [
                      Text(
                        widget.conversationItem.conversationPartner.name,
                        // style: kTextH3,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      lastMessageBuilder()
                    ],
                  )),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        widget.conversationItem.lastMessage !=
                                ChatMessage.empty()
                            ? widget
                                .conversationItem.lastMessage.timestampFormated
                            : '',
                        // style: kTextLabel2Transparent,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      if (widget.conversationItem.unreadMessagesCount != 0)
                        Badge(
                          badgeContent: Text(
                            widget.conversationItem.unreadMessagesCount
                                .toString(),
                          ),
                        ),
                    ],
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
