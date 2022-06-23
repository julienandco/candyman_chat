import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:neon_chat/src/conversation/presentation/widgets/conversation_app_bar.dart';
import 'package:neon_chat/src/conversation/presentation/widgets/default_conversation_appbar.dart';
import 'package:neon_chat/src/core/util/util.dart';

import '../../conversations/conversations.dart';

/// Style data structure for the Conversations page
class ConversationsStyle {
  final bool showAppBarAboveConversations;
  final Text appBarTitle;
  final Widget noConversationsWidget;
  final String noConversationsPlaceholderStringWeb;
  final Color appBarColor;
  final bool appBarCenterTitle;
  final Color fabColor;
  final Widget fabIcon;
  final bool showFab;
  final Function()? fabAction;
  final Widget loadingWidget;
  final ConversationListItemStyle chatListItemStyle;

  const ConversationsStyle({
    this.showAppBarAboveConversations = false,
    this.appBarTitle = const Text('NEON CHAT'),
    this.noConversationsPlaceholderStringWeb = 'Conversations',
    this.appBarCenterTitle = true,
    this.noConversationsWidget = const Center(
      child: Text('No Conversations found!'),
    ),
    this.appBarColor = const Color.fromARGB(255, 25, 5, 55),
    this.fabColor = const Color.fromARGB(255, 25, 5, 55),
    this.fabIcon = const Icon(Icons.message),
    this.showFab = false,
    this.fabAction,
    this.loadingWidget = const Center(
      child: CircularProgressIndicator(color: Color.fromARGB(255, 25, 5, 55)),
    ),
    this.chatListItemStyle = const ConversationListItemStyle(),
  });
}

/// Style data structure for elements of the [ConversationListItem] Widget
class ConversationListItemStyle {
  final TextStyle lastMassageTextStyle;
  final Color focusMenuBlurBackgroundColor;
  final String focusMenuText;
  final String conversationBlockedLabel;
  final TextStyle? conversationBlockedLabelStyle;
  final TextStyle focusMenuTextStyle;
  final Widget focusMenuIcon;
  final Color focusMenuColor;
  final Color listTileColor;
  final Color listTileHoverColor;
  final TextStyle titleTextStyle;
  final TextStyle subtitleTextStyle;
  final TextStyle lastMessageTimeTextStyle;
  final Color badgeColor;
  final TextStyle badgeTextStyle;

  const ConversationListItemStyle({
    this.lastMassageTextStyle = const TextStyle(color: Colors.black54),
    this.focusMenuBlurBackgroundColor = Colors.black,
    this.conversationBlockedLabel = 'blocked',
    this.conversationBlockedLabelStyle,
    this.focusMenuText = 'delete',
    this.focusMenuTextStyle = const TextStyle(),
    this.focusMenuIcon = const Icon(Icons.delete, color: Colors.black),
    this.focusMenuColor = Colors.white,
    this.listTileColor = Colors.black12,
    this.listTileHoverColor = Colors.blueAccent,
    this.titleTextStyle =
        const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    this.subtitleTextStyle = const TextStyle(color: Colors.black54),
    this.lastMessageTimeTextStyle = const TextStyle(color: Colors.black54),
    this.badgeColor = const Color.fromARGB(255, 25, 5, 55),
    this.badgeTextStyle = const TextStyle(
        color: Colors.white, fontWeight: FontWeight.w600, fontSize: 12),
  });
}

/// Style data structure for the group chat overview page
class GroupChatOverviewStyle {
  final Color appBarColor;
  final String memberListTitle;
  final TextStyle? memberListTitleStyle;
  final bool centerAppbarTitle;
  final TextStyle? userNameTextStyle;

  const GroupChatOverviewStyle({
    required this.appBarColor,
    this.memberListTitle = 'Members',
    this.memberListTitleStyle,
    this.centerAppbarTitle = true,
    this.userNameTextStyle,
  });
}

/// Style data structure for a Conversation page
class ConversationStyle {
  /// Your custom implementation of [ConversationAppbar] to be displayed.
  final ConversationAppbar Function(Conversation)?
      buildCustomConversationAppBar;

  final Color backgroundColor;
  final List<Color> ignorePointersColors;
  final EdgeInsetsGeometry messageListPadding;
  final EdgeInsetsGeometry searchPadding;
  final String youString;

  const ConversationStyle({
    this.buildCustomConversationAppBar,
    this.backgroundColor = Colors.white,
    this.ignorePointersColors = const [Colors.black26, Colors.transparent],
    this.messageListPadding =
        const EdgeInsets.only(top: 20, bottom: 100, left: 20, right: 20),
    this.searchPadding = const EdgeInsets.only(bottom: 10, left: 10, right: 10),
    this.youString = 'You',
  });
}

/// Style data structure for the [MessageBubble] data structure
class MessageBubbleStyle {
  final double maxWidthPercentage;
  final bool showAvatar;
  final TextStyle? otherUserNameStyle;
  final TextStyle? otherUserMessageTimestampStyle;
  final TextStyle? ownMessageTimestampStyle;
  final TextStyle? ownMessageTextStyle;
  final TextStyle? otherUserMessageTextStyle;
  final Color focusedMenuItemBackgroundColor;
  final Widget? copyIcon;
  final Widget? deleteIcon;
  final String? copyLabel;
  final String? deleteLabel;
  final TextStyle? actionLabelStyle;
  final TextStyle? linkPreviewTitleTextStyle;
  final TextStyle? linkTextStyle;
  final TextStyle? linkPreviewBodyTextStyle;
  final Color ownMessageColor;
  final Color otherUserMessageColor;
  final BoxDecoration? decoration;
  final bool hideSeenReceivedIcon;
  final Widget? seenIcon;
  final Widget? receivedIcon;
  final String messageIsUploadingLabel;
  final String messageBubbleDeletedLabel;
  final TextStyle? messageBubbleDeletedLabelStyle;
  final String messageTypeNotSupportedLabel;
  final double bubbleRadius;
  final AudioPlayerStyle audioPlayerStyle;
  final VideoPlayerStyle videoPlayerStyle;
  final FileBubbleStyle fileBubbleStyle;

  final void Function()? onCopyToClipboard;
  final void Function(
    void Function() onDeleteForMe,
    void Function() onDeleteForAll,
  )? onShowDeletionDialog;

  const MessageBubbleStyle({
    this.maxWidthPercentage = 2 / 3,
    this.showAvatar = false,
    this.otherUserNameStyle = const TextStyle(fontWeight: FontWeight.bold),
    this.otherUserMessageTimestampStyle = const TextStyle(
      fontSize: 12.0,
      color: Colors.black,
    ),
    this.ownMessageTimestampStyle = const TextStyle(
      fontSize: 12.0,
      color: Colors.white,
    ),
    this.ownMessageTextStyle = const TextStyle(
      fontSize: 18.0,
      color: Colors.white,
    ),
    this.otherUserMessageTextStyle = const TextStyle(
      fontSize: 18.0,
      color: Colors.white,
    ),
    this.focusedMenuItemBackgroundColor = Colors.white,
    this.copyIcon,
    this.deleteIcon,
    this.copyLabel,
    this.deleteLabel,
    this.linkTextStyle,
    this.actionLabelStyle,
    this.ownMessageColor = const Color.fromARGB(255, 25, 5, 55),
    this.otherUserMessageColor = Colors.grey,
    this.decoration,
    this.hideSeenReceivedIcon = false,
    this.seenIcon,
    this.receivedIcon,
    this.messageBubbleDeletedLabelStyle,
    this.messageIsUploadingLabel = 'uploading...',
    this.messageBubbleDeletedLabel = 'deleted',
    this.messageTypeNotSupportedLabel = 'not supported',
    this.bubbleRadius = 16.0,
    this.onCopyToClipboard,
    this.linkPreviewBodyTextStyle = const TextStyle(
      fontSize: 14.0,
      color: Colors.white,
    ),
    this.linkPreviewTitleTextStyle = const TextStyle(
      fontSize: 18.0,
      color: Colors.white,
    ),
    this.onShowDeletionDialog,
    this.audioPlayerStyle = const AudioPlayerStyle(),
    this.videoPlayerStyle = const VideoPlayerStyle(),
    this.fileBubbleStyle = const FileBubbleStyle(),
  });
}

/// Style data structure for the [SearchAppBar] widget
class SearchAppBarStyle {
  final Widget? leading;
  final InputDecoration textFieldDecoration;
  final Color iconColor;
  final Color searchTextCursorColor;
  final TextStyle searchTextInput;
  final String lastActivityPrefix;
  final BoxDecoration searchBarDecoration;

  const SearchAppBarStyle({
    this.leading,
    this.textFieldDecoration = const InputDecoration(
        hintText: '...',
        hintStyle: TextStyle(color: Colors.white38),
        border: InputBorder.none),
    this.lastActivityPrefix = 'last seen at: ',
    this.iconColor = Colors.white,
    this.searchTextCursorColor = Colors.white,
    this.searchTextInput = const TextStyle(color: Colors.white),
    this.searchBarDecoration =
        const BoxDecoration(color: Color.fromARGB(255, 25, 5, 55)),
  });
}

/// Style data structure for the [BottomBar] widget
class BottomBarStyle {
  /// Your own bottom bar to be displayed.
  final Widget? customBottomBar;

  final Color chatBarColor;
  final BorderRadius borderRadius;
  final Color assetPickerColor;
  final Color cameraPickerColor;
  final Color iconsColor;
  final BoxConstraints constraints;
  final EdgeInsets padding;
  final double? maxWidth;
  final Widget galleryIcon;
  final Color galleryIconColor;
  final double galleryIconSize;
  final Widget? galleryIconLabel;
  final Widget mediaPickerIcon;
  final Color mediaPickerIconColor;
  final double mediaPickerIconSize;
  final Widget? mediaPickerIconLabel;
  final Widget audioMessageIcon;
  final TextStyle? audioRecordingLabelStyle;
  final TextStyle? textFieldStyle;
  final InputDecoration? textFieldDecoration;
  final Color cursorColor;
  final Widget attachmentIcon;
  final Widget cameraIcon;
  final Widget sendIcon;
  final double sendIconSize;
  final BoxShadow boxShadow;

  const BottomBarStyle({
    this.customBottomBar,
    this.chatBarColor = Colors.white,
    this.borderRadius = const BorderRadius.all(Radius.circular(25)),
    this.assetPickerColor = Colors.red,
    this.cameraPickerColor = Colors.red,
    this.iconsColor = Colors.white,
    this.constraints = const BoxConstraints(maxWidth: kMaxWidth),
    this.padding = const EdgeInsets.symmetric(horizontal: 15),
    this.maxWidth,
    this.galleryIcon = const Icon(Icons.camera_alt_outlined),
    this.galleryIconColor = Colors.white,
    this.galleryIconSize = 40,
    this.galleryIconLabel,
    this.mediaPickerIcon = const Icon(Icons.attach_file_outlined),
    this.mediaPickerIconColor = Colors.white,
    this.mediaPickerIconSize = 40,
    this.mediaPickerIconLabel,
    this.audioMessageIcon = const Icon(Icons.mic),
    this.audioRecordingLabelStyle,
    this.textFieldStyle,
    this.textFieldDecoration = const InputDecoration(
      border: InputBorder.none,
      hintText: 'Message...',
      hintStyle: TextStyle(color: Colors.black38),
    ),
    this.cursorColor = Colors.black,
    this.attachmentIcon = const Icon(Icons.attach_file),
    this.cameraIcon = const Icon(Icons.camera_alt_outlined),
    this.sendIcon = const Icon(
      Icons.send_rounded,
      color: Colors.black,
    ),
    this.sendIconSize = 46,
    this.boxShadow = const BoxShadow(
      color: Colors.black12,
      spreadRadius: 2,
      blurRadius: 5,
      offset: Offset(2, 4),
    ),
  });
}

class AudioPlayerStyle {
  final Widget playIcon;
  final Widget playingIcon;
  final TextStyle? labelStyle;
  final Color sliderColor;
  final Color activeTrackColor;
  final Color thumbColor;
  final Color playButtonColor;

  const AudioPlayerStyle({
    this.playIcon = const Icon(Icons.play_arrow, color: Colors.white, size: 18),
    this.playingIcon = const Icon(Icons.pause, color: Colors.white, size: 18),
    this.labelStyle,
    this.sliderColor = Colors.red,
    this.activeTrackColor = Colors.yellow,
    this.thumbColor = Colors.redAccent,
    this.playButtonColor = Colors.red,
  });
}

class VideoPlayerStyle {
  final BoxDecoration? outerDecoration;
  final BoxDecoration innerDecoration;
  final Widget playIcon;

  const VideoPlayerStyle({
    this.outerDecoration,
    this.innerDecoration = const BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.red,
    ),
    this.playIcon = const Icon(Icons.play_arrow, color: Colors.white),
  });
}

class FileBubbleStyle {
  final Widget downloadIcon;
  final Widget progressIndicator;
  final String fileTypeNotSupportedLabel;
  final TextStyle? labelStyle;

  const FileBubbleStyle({
    this.downloadIcon = const Icon(
      Icons.download,
      color: Colors.red,
    ),
    this.progressIndicator = const CircularProgressIndicator(),
    this.fileTypeNotSupportedLabel = 'Not supported',
    this.labelStyle,
  });
}

/// Style data structure for the flutter toast that gets displayed when
/// receiving a push notification.
class PushNotificationToastStyle {
  final EdgeInsetsGeometry padding;
  final double toastHeight;
  final Decoration decoration;
  final TextStyle notificationTitleStyle;
  final TextStyle notificationBodyStyle;
  final Widget dismissIcon;

  final Duration toastVisibilityDuration;
  final Duration toastDisappearAnimationDuration;
  final StyledToastPosition toastPosition;

  const PushNotificationToastStyle({
    this.padding = const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
    this.toastHeight = 100,
    this.decoration = const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      color: Color.fromARGB(100, 25, 5, 55),
      boxShadow: [
        BoxShadow(
          blurRadius: 10,
          spreadRadius: 5,
          offset: Offset(0, 3),
          color: Colors.black38,
        )
      ],
    ),
    this.notificationTitleStyle =
        const TextStyle(color: Colors.black, fontSize: 16),
    this.notificationBodyStyle =
        const TextStyle(color: Colors.white, fontSize: 12),
    this.dismissIcon = const Icon(
      CupertinoIcons.xmark,
      color: Colors.white,
    ),
    this.toastVisibilityDuration = const Duration(seconds: 8),
    this.toastDisappearAnimationDuration = const Duration(seconds: 1),
    this.toastPosition = StyledToastPosition.top,
  });
}
