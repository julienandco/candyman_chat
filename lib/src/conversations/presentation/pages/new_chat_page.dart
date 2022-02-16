//TODO: delete?

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:papeo_app/core/domain/entities/user.dart';
// import 'package:papeo_app/core/presentation/bloc/authentication_bloc.dart';
// import 'package:papeo_app/core/presentation/widgets/custom_progress_indicator.dart';
// import 'package:papeo_app/core/presentation/widgets/empty_data_widget.dart';
// import 'package:papeo_app/core/presentation/widgets/headers/sub_header.dart';
// import 'package:papeo_app/core/presentation/widgets/inputs/text_input_field.dart';
// import 'package:papeo_app/core/services/dynamic_links_service.dart';
// import 'package:papeo_app/core/style/color_constants.dart';
// import 'package:papeo_app/core/style/padding_constants.dart';
// import 'package:papeo_app/core/style/typo_constants.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:papeo_app/features/chat/presentation/pages/chat_loader.dart';
// import 'package:papeo_app/features/chats/domain/repository/conversation_repository.dart';
// import 'package:papeo_app/features/chats/presentation/widgets/new_chat_list_item.dart';
// import 'package:papeo_app/features/party_friends/presentation/bloc/party_friends_bloc.dart';
// import 'package:papeo_app/injection.dart';
// import 'package:share_plus/share_plus.dart';

// class NewChatPage extends StatefulWidget {
//   final User user;

//   NewChatPage({
//     Key? key,
//     required this.user,
//   }) : super(key: key);

//   @override
//   _NewChatPageState createState() => _NewChatPageState();
// }

// class _NewChatPageState extends State<NewChatPage> {
//   void _shareApp() async {
//     final me = context.read<AuthenticationBloc>().authenticatedUser;
//     if (me != null) {
//       final dynamicLink = getIt<DynamicLinkService>();
//       final link = await dynamicLink.shareReferralLink(me.id);
//       Share.share(link);
//     }
//   }

//   void _openChatWithUser(User user) async {
//     final conversation =
//         await getIt<ConversationRepository>().createConversations(user.id);
//     Navigator.pushReplacement(
//       context,
//       CupertinoPageRoute(
//         builder: (context) => ChatLoader(
//           conversationId: conversation.id,
//           userProfileId: user.id,
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider<PartyFriendsBloc>(
//       create: (context) => getIt<PartyFriendsBloc>()
//         ..add(InitializePartyFriends(
//             userId: widget.user.id, context: context, onlyAccepted: true)),
//       child: Builder(
//         builder: (context) => Scaffold(
//           backgroundColor: kColorPrimary,
//           body: Stack(
//             children: [
//               Column(
//                 children: [
//                   SubHeader(
//                     title: Text(
//                       'chatsNewChat',
//                       style: kTextH1,
//                     ).tr(),
//                   ),
//                   Container(
//                     margin: kPadMedium,
//                     constraints: kBoxConstraints,
//                     child: TextInputField(
//                       onChange: (value) => context
//                           .read<PartyFriendsBloc>()
//                           .add(PartyFriendsSearchTextChanged(value)),
//                       hint: 'search'.tr(),
//                     ),
//                   ),
//                   Expanded(
//                     child: BlocBuilder<PartyFriendsBloc, PartyFriendsState>(
//                       builder: (context, state) {
//                         return ListView(
//                           physics: BouncingScrollPhysics(
//                               parent: AlwaysScrollableScrollPhysics()),
//                           padding:
//                               kPadMedium + const EdgeInsets.only(bottom: 100),
//                           children: state.map(
//                             uninitialized: (_) => [],
//                             loading: (_) => [
//                               Center(
//                                 child: CustomProgressIndicator(),
//                               ),
//                             ],
//                             loaded: (state) => state.friends.isEmpty
//                                 ? [
//                                     EmptyDataWidget(
//                                       title: 'noPartyFriendsHeader'.tr(),
//                                       body: 'noPartyFriendsBody'.tr(),
//                                       buttonTitle:
//                                           'noPartyFriendsActionButton'.tr(),
//                                       buttonPrefix: SvgPicture.asset(
//                                           'assets/vectors/shareIcon.svg'),
//                                       onTap: _shareApp,
//                                     ),
//                                   ]
//                                 : state.friends
//                                     .map(
//                                       (e) => Align(
//                                         alignment: Alignment.center,
//                                         child: NewChatListItem(
//                                           user: e.user,
//                                           onTap: () =>
//                                               _openChatWithUser(e.user),
//                                         ),
//                                       ),
//                                     )
//                                     .toList(),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
