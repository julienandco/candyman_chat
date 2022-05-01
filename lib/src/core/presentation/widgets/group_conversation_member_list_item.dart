import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';

import 'package:neon_chat/neon_chat.dart';

class GroupConversationMemberListItem extends StatelessWidget {
  final Function(String)? onOpenUserProfile;
  final FirebaseUser user;
  final GroupChatOverviewStyle style;

  const GroupConversationMemberListItem({
    Key? key,
    this.onOpenUserProfile,
    required this.user,
    required this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onOpenUserProfile?.call(user.id),
      child: Row(
        children: [
          AvatarWidget(imgUrl: user.profilePictureURL),
          const SizedBox(
            width: 15,
          ),
          AutoSizeText(
            user.username,
            style: style.userNameTextStyle,
          ),
        ],
      ),
    );
  }
}
