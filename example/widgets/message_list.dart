import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:papeo_app/core/domain/entities/user.dart';
import 'package:papeo_app/core/style/padding_constants.dart';
import 'package:papeo_app/core/style/typo_constants.dart';
import 'package:papeo_app/features/chat/data/models/chat_message_model.dart';
import 'package:papeo_app/features/chat/presentation/bloc/chat_bloc/chat_bloc.dart';
import 'package:papeo_app/features/chat/presentation/bloc/chat_search_bloc/chat_search_bloc.dart';
import 'package:papeo_app/features/chat/presentation/widgets/message_bubble.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class MessageList extends StatelessWidget {
  final User? otherUser;

  const MessageList({
    Key? key,
    required this.otherUser,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        return state.maybeMap(
          loadSuccess: (state) => _MessageListView(
            messages: state.messages,
            messageBuilder: (ChatMessageModel message, int index) =>
                AutoScrollTag(
              key: ValueKey(message.id),
              index: index,
              controller: context.read<ChatSearchBloc>().messageListController,
              child: Container(
                margin: const EdgeInsets.only(bottom: 8),
                child: MessageBubble(
                  message: message,
                  otherUser: otherUser,
                  showAvatar:state.conversation.isPartyChat,
                ),
              ),
            ),
          ),
          orElse: () => SliverToBoxAdapter(),
        );
      },
    );
  }
}

class _MessageListView extends StatefulWidget {
  final List<ChatMessageModel> messages;
  final Widget Function(ChatMessageModel, int)? messageBuilder;

  final Widget Function(String)? dateBuilder;
  final bool inverted;
  _MessageListView({
    required this.messages,
    this.messageBuilder,
    this.dateBuilder,
    this.inverted = true,
  });

  @override
  _MessageListViewState createState() => _MessageListViewState();
}

class _MessageListViewState extends State<_MessageListView> {
  @override
  Widget build(BuildContext context) {
    DateTime? currentDate;

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (
          context,
          i,
        ) {
          final timestamp = widget.messages[i].timestamp ?? DateTime.now();
          bool last = false;
          bool showDate;

          if (widget.messages.length - 1 == i) {
            last = true;
          }

          DateTime messageDate = DateTime(
            timestamp.year,
            timestamp.month,
            timestamp.day,
          );

          // Needed for inverted list
          DateTime previousDate = currentDate ?? messageDate;

          if (currentDate == null) {
            currentDate = messageDate;
            showDate = !widget.inverted || widget.messages.length == 1;
          } else if (currentDate!.difference(messageDate).inDays != 0) {
            showDate = true;
            currentDate = messageDate;
          } else if (i == widget.messages.length - 1 && widget.inverted) {
            showDate = true;
          } else {
            showDate = false;
          }

          return Align(
            child: Column(
              children: <Widget>[
                if (showDate &&
                    (!widget.inverted ||
                        widget.messages.length == 1 ||
                        (last && widget.inverted)))
                  _DateBuilder(
                    date: widget.inverted ? previousDate : currentDate!,
                  ),
                widget.messageBuilder != null
                    ? widget.messageBuilder!(widget.messages[i], i)
                    : SizedBox.shrink(),
                if (showDate &&
                    widget.inverted &&
                    widget.messages.length > 1 &&
                    !last)
                  _DateBuilder(
                    date: widget.inverted ? previousDate : currentDate!,
                  ),
              ],
            ),
          );
        },
        childCount: widget.messages.length,
      ),
    );
  }
}

class _DateBuilder extends StatelessWidget {
  _DateBuilder({
    required this.date,
  });

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    final text =
        DateFormat('d. MMM${date.year != DateTime.now().year ? ' yyyy' : ''}')
            .format(date);
    return Center(
      child: Padding(
        padding: kPadVertMedium,
        child: Text(
          text,
          style: kTextListItem,
        ),
      ),
    );
  }
}
