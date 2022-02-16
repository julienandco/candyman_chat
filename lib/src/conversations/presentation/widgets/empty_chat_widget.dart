//TODO: delete?

// import 'package:auto_size_text_pk/auto_size_text_pk.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:papeo_app/core/presentation/bloc/authentication_bloc.dart';
// import 'package:papeo_app/core/style/color_constants.dart';
// import 'package:papeo_app/core/style/padding_constants.dart';
// import 'package:papeo_app/core/style/typo_constants.dart';
// import 'package:papeo_app/features/chats/presentation/pages/new_chat_page.dart';
// import 'package:provider/provider.dart';

// class EmptyChatWidget extends StatelessWidget {
//   const EmptyChatWidget({
//     Key? key,
//   }) : super(key: key);

//   void _openNewChat(BuildContext context) {
//     final me = context.read<AuthenticationBloc>().authenticatedUser;
//     if (me == null) return;
//     Navigator.of(context).push(
//       CupertinoPageRoute(
//         builder: (context) => NewChatPage(user: me),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: kPadMedium,
//       child: Column(children: [
//         Padding(
//           padding: kPadBottomMedium,
//           child: AutoSizeText('emptyPrivateChatsHeader'.tr(),
//               style: kTextBody32SemiBold),
//         ),
//         Padding(
//           padding: kPadTopLarge,
//           child: RichText(
//             textScaleFactor: 1.5,
//             text: TextSpan(
//               children: [
//                 TextSpan(
//                   text: "chatsEmpty1".tr(),
//                   style: kTextBody16,
//                 ),
//                 TextSpan(text: "chatsEmpty2".tr(), style: kTextBody16SemiBold),
//                 TextSpan(
//                   text: "chatsEmpty3".tr(),
//                   style: kTextBody16,
//                 ),
//                 WidgetSpan(
//                   child: Padding(
//                     padding: kPadHorSmall,
//                     child: GestureDetector(
//                       onTap: () => _openNewChat(context),
//                       child: Container(
//                         width: 20,
//                         height: 20,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           gradient: kGradientMain,
//                         ),
//                         child: Center(
//                           child: SvgPicture.asset(
//                             'assets/vectors/papeoButtonIcon=options.svg',
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 TextSpan(
//                   text: "chatsEmpty4".tr(),
//                   style: kTextBody16,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ]),
//     );
//   }
// }
