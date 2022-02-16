//TODO: delete?

// import 'package:auto_size_text_pk/auto_size_text_pk.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:focused_menu/focused_menu.dart';
// import 'package:focused_menu/modals.dart';
// import 'package:papeo_app/core/presentation/widgets/notification_bubble.dart';
// import 'package:papeo_app/core/presentation/widgets/media/user_avatar.dart';
// import 'package:papeo_app/core/style/color_constants.dart';
// import 'package:papeo_app/core/style/padding_constants.dart';
// import 'package:papeo_app/core/style/typo_constants.dart';
// import 'package:papeo_app/core/util/navigation_functions.dart';
// import 'package:papeo_app/features/chat/data/models/chat_message_model.dart';
// import 'package:papeo_app/features/chat/domain/entities/chat_message_entity.dart';
// import 'package:papeo_app/features/chat/presentation/pages/chat_loader.dart';
// import 'package:papeo_app/features/chats/domain/entities/conversation_item.dart';
// import 'package:papeo_app/features/chats/presentation/bloc/conversations_bloc/conversations_bloc.dart';
// import 'package:papeo_app/features/chats/presentation/cubit/cubit/current_conversation_cubit.dart';
// import 'package:papeo_app/features/chats/presentation/widgets/party_thumbnail.dart';

// class ChatListItem extends StatefulWidget {
//   ChatListItem({
//     Key? key,
//     required this.conversationItem,
//   }) : super(key: key);
//   final ConversationItem conversationItem;
//   @override
//   _ChatListItemState createState() => _ChatListItemState();
// }

// class _ChatListItemState extends State<ChatListItem> {
//   bool _onHover = false;

//   @override
//   Widget build(BuildContext context) {
//     Widget lastMessageBuilder() {
//       if (widget.conversationItem.user.isBlocked) {
//         return Text(
//           'chatBlocked'.tr(),
//           style: kTextChatMessageTime,
//         );
//       } else if (widget.conversationItem.lastMessage !=
//           ChatMessageModel.empty()) {
//         switch (widget.conversationItem.lastMessage.type) {
//           case ChatMessageType.text:
//             return Text(
//               widget.conversationItem.lastMessage.text!,
//               maxLines: 1,
//               overflow: TextOverflow.ellipsis,
//               style: kTextLabel,
//             );
//           case ChatMessageType.image:
//             return Text(
//               '📷 ' + 'chatMessageTypeImage'.tr(),
//               style: kTextLabel,
//             );
//           case ChatMessageType.video:
//             return Text(
//               '📹 ' + 'chatMessageTypeVideo'.tr(),
//               style: kTextLabel,
//             );
//           case ChatMessageType.voice:
//             return Text(
//               '🎤 ' + 'chatMessageTypeVoice'.tr(),
//               style: kTextLabel,
//             );
//           case ChatMessageType.file:
//             return Text(
//               '📁 ' + 'chatMessageTypeFile'.tr(),
//               style: kTextLabel,
//             );
//           case ChatMessageType.deleted:
//             return Text(
//               'chatMessageTypeDeleted'.tr(),
//               style: kTextChatMessageTime,
//             );
//           default:
//             return Text(
//               'chatMessageTypeUnknown'.tr(),
//               style: kTextLabel,
//             );
//         }
//       } else
//         return const SizedBox.shrink();
//     }

//     if (widget.conversationItem.lastMessage == ChatMessageModel.empty())
//       return SizedBox();
//     else
//       return FocusedMenuHolder(
//         duration: Duration(milliseconds: 200),
//         key: Key(widget.conversationItem.converstaion.id),
//         onPressed: () {},
//         menuItemExtent: 45,
//         menuOffset: 10.0,
//         blurSize: 0.0,
//         blurBackgroundColor: kColorBlack,
//         menuWidth: MediaQuery.of(context).size.width * 0.6,
//         menuBoxDecoration:
//             BoxDecoration(borderRadius: BorderRadius.circular(50)),
//         menuItems: [
//           FocusedMenuItem(
//             backgroundColor: kColorPrimary,
//             title: Container(
//               width: MediaQuery.of(context).size.width * 0.5 - 50,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Flexible(
//                     fit: FlexFit.loose,
//                     child: SvgPicture.asset(
//                       'assets/vectors/trashCanIcon.svg',
//                       color: kColorAccent,
//                     ),
//                   ),
//                   Flexible(
//                     fit: FlexFit.loose,
//                     child: AutoSizeText(
//                       'delete'.tr(),
//                       style: kTextLabel,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             trailingIcon: null,
//             onPressed: () => context
//                 .read<ConversationsBloc>()
//                 .hideConversation(widget.conversationItem.converstaion.id),
//           ),
//         ],
//         child: GestureDetector(
//           onTap: () {
//             if (isWidthOverLimit(context))
//               context
//                   .read<CurrentConversationCubit>()
//                   .onCurrentConverstationChanaged(
//                     widget.conversationItem.user.id,
//                     widget.conversationItem.converstaion.id,
//                   );
//             else
//               Navigator.push(
//                 context,
//                 CupertinoPageRoute(
//                   builder: (context) => ChatLoader(
//                     userProfileId: widget.conversationItem.user.id,
//                     conversationId: widget.conversationItem.converstaion.id,
//                   ),
//                 ),
//               );
//           },
//           child: MouseRegion(
//             onEnter: (_) {
//               _onHover = true;
//               setState(() {});
//             },
//             onExit: (_) {
//               _onHover = false;
//               setState(() {});
//             },
//             child: AnimatedContainer(
//               duration: Duration(milliseconds: 150),
//               padding: kPadMedium,
//               decoration: BoxDecoration(
//                 color: (context
//                                 .watch<CurrentConversationCubit>()
//                                 .state
//                                 .conversationId ==
//                             widget.conversationItem.converstaion.id ||
//                         _onHover)
//                     ? kColorPrimaryDarker
//                     : kColorPrimary,
//               ),
//               child: Row(
//                 children: [
//                   widget.conversationItem.isPartyChat
//                       ? PartyChatThumbnail(
//                           uploadId:
//                               widget.conversationItem.converstaion.thumbnail,
//                         )
//                       : GestureDetector(
//                           behavior: HitTestBehavior.opaque,
//                           onTap: () => openUserProfile(
//                               context, widget.conversationItem.user.id,
//                               user: widget.conversationItem.user),
//                           child: UserAvatar(
//                             user: widget.conversationItem.user.isBlocked
//                                 ? null
//                                 : widget.conversationItem.user,
//                           ),
//                         ),
//                   SizedBox(
//                     width: 15,
//                   ),
//                   Expanded(
//                       child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       ...(isPartyChat)
//                           ? [
//                               Text(
//                                 widget.conversationItem.converstaion
//                                         .displayName ??
//                                     '',
//                                 style: kTextBody16SemiBold,
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(top: 7),
//                                 child: Row(
//                                   children: [
//                                     UserAvatar(
//                                       size: 16,
//                                       user:
//                                           widget.conversationItem.user.isBlocked
//                                               ? null
//                                               : widget.conversationItem.user,
//                                     ),
//                                     SizedBox(width: 5),
//                                     Text(
//                                       widget.conversationItem.user.name,
//                                       style: kTextLabel,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ]
//                           : [
//                               Text(
//                                 widget.conversationItem.user.name,
//                                 style: kTextH3,
//                               ),
//                             ],
//                       SizedBox(
//                         height: 5,
//                       ),
//                       if (!isPartyChat) lastMessageBuilder()
//                     ],
//                   )),
//                   SizedBox(
//                     width: 15,
//                   ),
//                   // _selected
//                   //     ? Container(
//                   //         child: Center(
//                   //           child: SvgPicture.asset(
//                   //               'assets/vectors/trashCanIcon.svg'),
//                   //         ),
//                   //       )
//                   //     :
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     mainAxisSize: MainAxisSize.max,
//                     children: [
//                       Text(
//                         widget.conversationItem.lastMessage !=
//                                 ChatMessageModel.empty()
//                             ? widget
//                                 .conversationItem.lastMessage.timestampFormated
//                             : '',
//                         style: kTextLabel2Transparent,
//                       ),
//                       SizedBox(
//                         height: 5,
//                       ),
//                       if (widget.conversationItem.unreadMessagesCount != 0)
//                         NotificationBubble(
//                           text: widget.conversationItem.unreadMessagesCount
//                               .toString(),
//                         ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       );
//   }
// }
