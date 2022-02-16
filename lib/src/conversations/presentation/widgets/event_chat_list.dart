//TODO: delete?

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:papeo_app/core/presentation/widgets/custom_progress_indicator.dart';
// import 'package:papeo_app/core/presentation/widgets/empty_data_widget.dart';
// import 'package:papeo_app/core/presentation/widgets/inputs/text_input_field.dart';
// import 'package:papeo_app/core/style/color_constants.dart';
// import 'package:papeo_app/core/style/padding_constants.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:papeo_app/features/chats/presentation/bloc/conversations_bloc/conversations_bloc.dart';
// import 'package:papeo_app/features/chats/presentation/bloc/local_conversations_search_bloc/local_conversations_search_bloc.dart';
// import 'package:papeo_app/features/search/presentation/pages/search_loader.dart';
// import 'chat_list_item.dart';

// class EventChatList extends StatefulWidget {
//   @override
//   _EventChatListState createState() => _EventChatListState();
// }

// class _EventChatListState extends State<EventChatList>
//     with AutomaticKeepAliveClientMixin {
//   final _scrollController = ScrollController();
//   bool _showSearchBar = false;
//   bool _textfieldEnabled = false;

//   @override
//   void initState() {
//     _scrollController.addListener(_onScroll);
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _scrollController.removeListener(_onScroll);
//     _scrollController.dispose();
//     super.dispose();
//   }

//   void _onScroll() {
//     bool neededShowValue = _showSearchBar;
//     if (_scrollController.offset < 0) {
//       neededShowValue = true;
//     } else if (_scrollController.offset > 0) {
//       neededShowValue = false;
//     }
//     if (_showSearchBar != neededShowValue) {
//       setState(() {
//         _showSearchBar = neededShowValue;
//         _textfieldEnabled = neededShowValue;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     super.build(context);
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         AnimatedContainer(
//           key: Key('EvenSearchBar'),
//           height: _showSearchBar ? 80 : 0,
//           duration: const Duration(milliseconds: 150),
//           padding: kPadHorMedium,
//           child: Center(
//             child: AnimatedOpacity(
//               duration: const Duration(milliseconds: 150),
//               opacity: _showSearchBar ? 1 : 0,
//               child: Focus(
//                 onFocusChange: (value) => context
//                     .read<LocalConversationsSearchBloc>()
//                     .searchSwitch(value, true),
//                 child: GestureDetector(
//                   onTap: () => setState(() {
//                     _textfieldEnabled = true;
//                   }),
//                   child: TextInputField(
//                     isEnabled: _textfieldEnabled,
//                     suffix: IconButton(
//                       icon: Icon(Icons.cancel),
//                       color: kColorAccent,
//                       onPressed: () {
//                         setState(() {
//                           _textfieldEnabled = false;
//                         });
//                         context
//                             .read<LocalConversationsSearchBloc>()
//                             .searchSwitch(false, true,
//                                 clearTextController: true);
//                       },
//                     ),
//                     textController: context
//                         .read<LocalConversationsSearchBloc>()
//                         .textController,
//                     hint: 'search'.tr(),
//                     onChange: (value) {
//                       context
//                           .read<LocalConversationsSearchBloc>()
//                           .query(value, true);
//                     },
//                     onSubmitted: (_) => context
//                         .read<LocalConversationsSearchBloc>()
//                         .searchSwitch(
//                           false,
//                           true,
//                         ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//         SizedBox(height: 10),
//         Expanded(
//           child: Builder(
//             builder: (context) {
//               final conversationsState =
//                   context.watch<ConversationsBloc>().state;

//               final conversationsSearchState =
//                   context.watch<LocalConversationsSearchBloc>().state;

//               final conversations = conversationsState.maybeMap(
//                 loadSuccess: (state) => conversationsSearchState.isSearchActive
//                     ? conversationsSearchState.conversations
//                     : state.partyConversations,
//                 orElse: () => [],
//               );
//               final isLoading = conversationsState.maybeMap(
//                 loadSuccess: (_) => false,
//                 orElse: () => true,
//               );
//               return conversations.isEmpty
//                   ? EmptyDataWidget(
//                       title: 'emptyEventChatsHeader'.tr(),
//                       body: 'emptyEventChatsBody'.tr(),
//                       buttonTitle: 'emptyEventChatsSearchParties'.tr(),
//                       buttonPrefix: SvgPicture.asset(
//                         'assets/vectors/papeoButtonIcon=search.svg',
//                       ),
//                       onTap: () => Navigator.of(context).push(
//                         CupertinoPageRoute(
//                           fullscreenDialog: true,
//                           builder: (context) => SearchLoader(),
//                         ),
//                       ),
//                     )
//                   : ListView.builder(
//                       padding: const EdgeInsets.symmetric(vertical: 10),
//                       controller: _scrollController,
//                       physics: BouncingScrollPhysics(
//                         parent: AlwaysScrollableScrollPhysics(),
//                       ),
//                       itemCount: (isLoading) ? 1 : conversations.length,
//                       itemBuilder: (_, index) {
//                         if (isLoading)
//                           return CustomProgressIndicator();
//                         else if (conversations.isEmpty) {
//                           return SizedBox();
//                         } else {
//                           return ChatListItem(
//                             key: Key(conversations[index].converstaion.id),
//                             conversationItem: conversations[index],
//                           );
//                         }
//                       },
//                     );
//             },
//           ),
//         ),
//       ],
//     );
//   }

//   @override
//   bool get wantKeepAlive => true;
// }
