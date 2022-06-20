import 'package:flutter/material.dart';
import 'package:neon_chat/neon_chat.dart';
import 'package:neon_chat/src/conversation/presentation/widgets/widgets.dart';

abstract class ConversationAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  final String? conversationThumbnail;

  const ConversationAppbar({
    Key? key,
    this.conversationThumbnail,
  });
}

// class TmpBar extends ConversationAppbar {
//   const TmpBar({Key? key})
//       : super(
//           key: key,
//           searchAppBarStyle: const SearchAppBarStyle(),
//           showCloseButton: false,
//         );

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

// void test(ConversationAppbar appBar) {}

// void main() {
//   final tmp = TmpBar();
//   test(tmp);
// }
