//TODO: delete?

// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:papeo_app/core/domain/entities/genders.dart';
// import 'package:papeo_app/core/domain/entities/user.dart';
// import 'package:papeo_app/core/presentation/widgets/media/user_avatar.dart';
// import 'package:papeo_app/core/style/color_constants.dart';
// import 'package:papeo_app/core/style/padding_constants.dart';
// import 'package:papeo_app/core/style/typo_constants.dart';

// class NewChatListItem extends StatelessWidget {
//   final User user;
//   final Function()? onTap;

//   const NewChatListItem({
//     Key? key,
//     required this.user,
//     this.onTap,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         margin: kPadVertMedium,
//         constraints: kBoxConstraints,
//         decoration: BoxDecoration(
//           color: kColorPrimary,
//         ),
//         child: Row(
//           children: [
//             UserAvatar(
//               user: user,
//             ),
//             SizedBox(
//               width: 15,
//             ),
//             Expanded(
//                 child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     Text(
//                       user.name,
//                       style: kTextH3,
//                     ),
//                     SizedBox(
//                       width: 10,
//                     ),
//                     SvgPicture.asset(user.gender.assetString),
//                     if (user.verification.verified)
//                       Padding(
//                         padding: kPadHorSmall,
//                         child: SvgPicture.asset(
//                             'assets/vectors/verifiedIcon=greenMark.svg'),
//                       ),
//                     Text(
//                       user.age.toString(),
//                       style: kTextBody,
//                     )
//                   ],
//                 ),
//                 SizedBox(
//                   height: 5,
//                 ),
//                 Text(
//                   'active'.tr() + ' ' + user.getLastActivityTimeText(context),
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                   style: kTextLabelDisabled,
//                 ),
//               ],
//             )),
//           ],
//         ),
//       ),
//     );
//   }
// }
