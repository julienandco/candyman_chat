import 'package:flutter/material.dart';
import 'package:neon_chat/src/core/util/util.dart';

// Conversations Style
class DefaultConverstionsStyle {
  final Text appBarTitle;
  final Color appBarColor;
  final Color fabColor;
  final Widget fabIcon;
  final Function()? fabAction;
  final Widget emtpyConversation;
  final Widget loadingWidget;

  const DefaultConverstionsStyle({
    this.appBarTitle = const Text('NEON CHAT'),
    this.appBarColor = const Color.fromARGB(255, 25, 5, 55),
    this.fabColor = const Color.fromARGB(255, 25, 5, 55),
    this.fabIcon = const Icon(Icons.message),
    this.fabAction,
    this.emtpyConversation = const Center(child: Text('no conversations')),
    this.loadingWidget = const Center(
      child: CircularProgressIndicator(color: Color.fromARGB(255, 25, 5, 55)),
    ),
  });
}

class DefaultChatListItem {
  final TextStyle lastMassageTextStyle;
  final Color focusMenuBlurBackroundColor;
  final String focusMenuText;
  final TextStyle focusMeueTextStyle;
  final Widget focusMenuIcon;
  final Color focusMenueColor;
  final Color listTileColor;
  final Color listTileHoverColor;
  final TextStyle titleTextStyle;
  final TextStyle subtitleTextStyle;
  final TextStyle lastMessageTimeTextStyle;
  final Color badgeColor;
  final TextStyle badgeTextStyle;

  const DefaultChatListItem({
    this.lastMassageTextStyle = const TextStyle(color: Colors.black54),
    this.focusMenuBlurBackroundColor = Colors.black,
    this.focusMenuText = 'delete',
    this.focusMeueTextStyle = const TextStyle(),
    this.focusMenuIcon = const Icon(Icons.delete, color: Colors.black),
    this.focusMenueColor = Colors.white,
    this.listTileColor = Colors.grey,
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

// Conversation Style
class DefaultConversationStyle {
  final Color backgroundColor;
  final List<Color> ignorPointersColors;
  final EdgeInsetsGeometry messageListPadding;
  final EdgeInsetsGeometry serachPadding;

  const DefaultConversationStyle({
    this.backgroundColor = Colors.white,
    this.ignorPointersColors = const [Colors.black26, Colors.transparent],
    this.messageListPadding =
        const EdgeInsets.only(top: 20, bottom: 100, left: 20, right: 20),
    this.serachPadding = const EdgeInsets.only(bottom: 10, left: 10, right: 10),
  });
}

class DefaultChatBubbleStyle {
  final double maxWidthPercentage;
  final bool showAvatar;
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
  final DefaultAudioPlayerStyle defaultAudioPlayerStyle;
  final DefaultVideoPlayerStyle defaultVideoPlayerStyle;
  final DefaultFileBubbleStyle defaultFileBubbleStyle;

  final void Function()? onCopyToClipboard;
  final void Function(
          void Function() onDeleteForMe, void Function() onDeleteForAll)?
      onShowDeletionDialog;

  const DefaultChatBubbleStyle({
    this.maxWidthPercentage = 2 / 3,
    this.showAvatar = false,
    this.otherUserNameStyle,
    this.messageTimestampStyle,
    this.focusedMenuItemBackgroundColor = Colors.white,
    this.copyIcon,
    this.deleteIcon,
    this.copyLabel,
    this.deleteLabel,
    this.actionLabelStyle,
    this.ownMessageColor = const Color.fromARGB(255, 25, 5, 55),
    this.otherUserMessageColor = Colors.grey,
    this.decoration,
    this.seenIcon,
    this.receivedIcon,
    this.messageIsUploadingLabel,
    this.messageBubbleDeletedLabel,
    this.messageTypeNotSupportedLabel,
    this.bubbleradius = 16.0,
    this.onCopyToClipboard,
    this.onShowDeletionDialog,
    this.defaultAudioPlayerStyle = const DefaultAudioPlayerStyle(),
    this.defaultVideoPlayerStyle = const DefaultVideoPlayerStyle(),
    this.defaultFileBubbleStyle = const DefaultFileBubbleStyle(),
  });
}

class DefaultSearchAppBarStyle {
  final Widget? leading;
  final InputDecoration textFieldDecoration;
  final Color iconColor;
  final Color searchTextCurserColor;
  final TextStyle searchTextInput;
  final BoxDecoration serachBarDecoration;

  const DefaultSearchAppBarStyle({
    this.leading,
    this.textFieldDecoration =
        const InputDecoration(hintText: '...', border: InputBorder.none),
    this.iconColor = Colors.white,
    this.searchTextCurserColor = Colors.white,
    this.searchTextInput = const TextStyle(color: Colors.white),
    this.serachBarDecoration =
        const BoxDecoration(color: Color.fromARGB(255, 25, 5, 55)),
  });
}

class DefaultBottomBarStyle {
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
  final Color curserColor;
  final Widget attachmentIcon;
  final Widget cameraIcon;
  final Widget sendIcon;
  final double sendIconSize;
  final BoxShadow? boxShadow;

  const DefaultBottomBarStyle({
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
    this.textFieldDecoration,
    this.curserColor = Colors.black,
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

class DefaultAudioPlayerStyle {
  final Widget playIcon;
  final Widget playingIcon;
  final TextStyle? labelStyle;
  final Color sliderColor;
  final Color activeTrackColor;
  final Color thumbColor;

  const DefaultAudioPlayerStyle({
    this.playIcon = const Icon(Icons.play_arrow, color: Colors.white, size: 18),
    this.playingIcon = const Icon(Icons.pause, color: Colors.white, size: 18),
    this.labelStyle,
    this.sliderColor = Colors.red,
    this.activeTrackColor = Colors.yellow,
    this.thumbColor = Colors.redAccent,
  });
}

class DefaultVideoPlayerStyle {
  final BoxDecoration? outerDecoration;
  final BoxDecoration innerDecoration;
  final Widget playIcon;

  const DefaultVideoPlayerStyle({
    this.outerDecoration,
    this.innerDecoration = const BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.red,
    ),
    this.playIcon = const Icon(Icons.play_arrow, color: Colors.white),
  });
}

class DefaultFileBubbleStyle {
  final Widget downloadIcon;
  final Widget progressIndicator;
  final String fileTypeNotSupportedLabel;
  final TextStyle? labelStyle;

  const DefaultFileBubbleStyle({
    this.downloadIcon = const Icon(
      Icons.download,
      color: Colors.red,
    ),
    this.progressIndicator = const CircularProgressIndicator(),
    this.fileTypeNotSupportedLabel = 'Not supported',
    this.labelStyle,
  });
}
