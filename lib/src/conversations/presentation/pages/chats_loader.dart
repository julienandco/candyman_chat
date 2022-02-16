//TODO: delete ?

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:papeo_app/core/presentation/bloc/authentication_bloc.dart';
// import 'package:papeo_app/core/presentation/bloc/bottom_navigation_bar_bloc.dart';
// import 'package:papeo_app/core/presentation/helper/authentication_wall.dart';
// import 'package:papeo_app/core/presentation/widgets/main_elements/main_navigation_bar.dart';
// import 'package:papeo_app/core/style/color_constants.dart';
// import 'package:papeo_app/core/style/padding_constants.dart';
// import 'package:papeo_app/core/style/radius_constants.dart';
// import 'package:papeo_app/core/style/shadow_constants.dart';
// import 'package:papeo_app/core/style/typo_constants.dart';
// import 'package:papeo_app/features/chat/presentation/pages/chat_loader.dart';
// import 'package:papeo_app/features/chats/presentation/bloc/conversations_bloc/conversations_bloc.dart';
// import 'package:papeo_app/features/chats/presentation/bloc/local_conversations_search_bloc/local_conversations_search_bloc.dart';
// import 'package:papeo_app/features/chats/presentation/cubit/cubit/current_conversation_cubit.dart';
// import 'package:papeo_app/features/chats/presentation/pages/new_chat_page.dart';
// import 'package:papeo_app/features/chats/presentation/widgets/event_chat_list.dart';
// import 'package:papeo_app/features/chats/presentation/widgets/private_chat_list.dart';
// import 'package:easy_localization/easy_localization.dart';

// class ChatsLoader extends StatefulWidget {
//   ChatsLoader({Key? key}) : super(key: key);
//   @override
//   ChatsLoaderState createState() => ChatsLoaderState();
// }

// class ChatsLoaderState extends State<ChatsLoader>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;

//   @override
//   void initState() {
//     _tabController = TabController(
//       length: 2,
//       vsync: this,
//     );

//     super.initState();
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   void onPapeoButtonPressed() {
//     context
//         .read<BottomNavigationBarBloc>()
//         .add(SetBottomNavigationBarIndex(context, 0));
//   }

//   List<OverlayAction> getOverlayActionsForPapeoButton() {
//     return [
//       OverlayAction(
//         label: 'chatsNewChat'.tr(),
//         onTap: () {
//           final me = context.read<AuthenticationBloc>().authenticatedUser;
//           if (me == null) return;
//           Navigator.of(context).push(
//             CupertinoPageRoute(
//               builder: (context) => NewChatPage(user: me),
//             ),
//           );
//         },
//       ),
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AuthenticationWall(
//       childProvider: (_) {
//         context.read<ConversationsBloc>().init();
//         return MultiBlocProvider(
//           providers: [
//             BlocProvider(
//               create: (context) => LocalConversationsSearchBloc(),
//             ),
//             BlocProvider(
//               create: (context) => CurrentConversationCubit(),
//             ),
//           ],
//           child: Builder(builder: (context) {
//             return MultiBlocListener(
//               listeners: [
//                 BlocListener<AuthenticationBloc, AuthenticationState>(
//                   listener: (context, state) {
//                     if (state is Unauthenticated) {
//                       context.read<ConversationsBloc>().dispose();
//                     }
//                   },
//                 ),
//                 BlocListener<ConversationsBloc, ConversationsState>(
//                   listener: (context, state) {
//                     state.maybeWhen(
//                       loadSuccess: (conversations) {
//                         context
//                             .read<LocalConversationsSearchBloc>()
//                             .setEntries(conversations);
//                         final currentConversationCubit =
//                             context.read<CurrentConversationCubit>();
//                         if (isWidthOverLimit(context) &&
//                             currentConversationCubit.state.conversationId ==
//                                 null &&
//                             conversations.isNotEmpty) {
//                           final firstChat = conversations.firstWhere(
//                               (chat) => chat.converstaion.partyId == null,
//                               orElse: () => conversations.first);
//                           currentConversationCubit
//                               .onCurrentConverstationChanaged(
//                                   firstChat.user.id, firstChat.converstaion.id);
//                         }
//                       },
//                       orElse: () {},
//                     );
//                   },
//                 ),
//               ],
//               child: Scaffold(
//                 backgroundColor: kColorPrimary,
//                 body: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Container(
//                       constraints: kChatPageConstraints,
//                       width: MediaQuery.of(context).size.width,
//                       child: Stack(
//                         children: [
//                           Column(
//                             children: [
//                               Container(
//                                 decoration: BoxDecoration(
//                                     color: kColorPrimary,
//                                     boxShadow: kShadowMedium,
//                                     borderRadius: BorderRadius.only(
//                                       bottomLeft: kRadiusMedium,
//                                       bottomRight: kRadiusMedium,
//                                     )),
//                                 child: SafeArea(
//                                   bottom: false,
//                                   child: Container(
//                                       padding: kPadHorLarge,
//                                       child: _Tabbar(
//                                         tabController: _tabController,
//                                       )),
//                                 ),
//                               ),
//                               Expanded(
//                                 child: TabBarView(
//                                   physics: BouncingScrollPhysics(),
//                                   controller: _tabController,
//                                   children: [
//                                     PrivateChatList(),
//                                     EventChatList(),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                     if (isWidthOverLimit(context))
//                       BlocBuilder<CurrentConversationCubit,
//                           CurrentConversationState>(
//                         builder: (context, state) {
//                           if (state.conversationId != null) {
//                             return Flexible(
//                               child: ChatLoader(
//                                 key: Key(state.conversationId!),
//                                 userProfileId: state.userProfileId!,
//                                 conversationId: state.conversationId!,
//                                 showCloseButton: false,
//                               ),
//                             );
//                           } else {
//                             return Expanded(
//                               child: Center(
//                                 child: Text(
//                                   'chats'.tr(),
//                                   style: kTextH1,
//                                 ),
//                               ),
//                             );
//                           }
//                         },
//                       )
//                   ],
//                 ),
//               ),
//             );
//           }),
//         );
//       },
//     );
//   }
// }

// class _Tabbar extends StatefulWidget {
//   _Tabbar({Key? key, required this.tabController}) : super(key: key);
//   final TabController tabController;

//   @override
//   __TabbarState createState() => __TabbarState();
// }

// class __TabbarState extends State<_Tabbar> {
//   late TabController _tabController;

//   @override
//   void initState() {
//     _tabController = widget.tabController;
//     _tabController.addListener(() {
//       context.read<LocalConversationsSearchBloc>().searchSwitch(
//             false,
//             _tabController.index == 1 ? true : false,
//             clearTextController: true,
//           );
//       setState(() {
//         _index = _tabController.index;
//       });
//     });
//     super.initState();
//   }

//   int _index = 0;
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<ConversationsBloc, ConversationsState>(
//       listener: (context, state) {
//         state.mapOrNull(
//           loadSuccess: (state) {
//             if (state.haveUnreadMessages) {
//               state.haveUnreadPartyMessages && !state.haveUnreadPrivateMessages
//                   ? _tabController.animateTo(1)
//                   : _tabController.animateTo(0);
//             }
//           },
//         );
//       },
//       builder: (context, state) {
//         bool unreadPrivateMessages = state.haveUnreadPrivateMessages;
//         bool unreadPartyMessages = state.haveUnreadPartyMessages;
//         return TabBar(
//           indicatorSize: TabBarIndicatorSize.label,
//           indicatorColor: kColorAccent,
//           controller: _tabController,
//           tabs: [
//             Tab(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Stack(
//                     alignment: Alignment.centerLeft,
//                     children: [
//                       SvgPicture.asset(
//                         'assets/vectors/chatIcon.svg',
//                         color: _index == 0 ? kColorWhite : kColorWhite50,
//                       ),
//                       if (unreadPrivateMessages)
//                         Container(
//                           width: 6,
//                           margin: EdgeInsets.only(right: 5, bottom: 15),
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: kColorAccent,
//                           ),
//                         ),
//                     ],
//                   ),
//                   SizedBox(
//                     width: 5,
//                   ),
//                   Text(
//                     'chats',
//                     style: _index == 0 ? kTextH2 : kTextH2Transparency,
//                   ).tr()
//                 ],
//               ),
//             ),
//             Tab(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Stack(
//                     alignment: Alignment.centerLeft,
//                     children: [
//                       SvgPicture.asset(
//                           'assets/vectors/mainMenuIcon=myParties.svg',
//                           color: _index == 1 ? kColorWhite : kColorWhite50),
//                       if (unreadPartyMessages)
//                         Container(
//                           width: 6,
//                           margin: EdgeInsets.only(right: 5, bottom: 15),
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: kColorAccent,
//                           ),
//                         ),
//                     ],
//                   ),
//                   SizedBox(
//                     width: 5,
//                   ),
//                   Text(
//                     'parties',
//                     style: _index == 1 ? kTextH2 : kTextH2Transparency,
//                   ).tr()
//                 ],
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
