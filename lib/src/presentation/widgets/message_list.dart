import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:neon_chat/neon_chat.dart';

class MessageList extends StatelessWidget {
  final FirebaseUser? otherUser;

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
            messageBuilder: (ChatMessage message, int index) => AutoScrollTag(
              key: ValueKey(message.id),
              index: index,
              controller: context.read<ChatSearchBloc>().messageListController,
              child: Container(
                margin: const EdgeInsets.only(bottom: 8),
                child: MessageBubble(
                  message: message,
                  // TODO: fallback
                  otherUserName: otherUser?.name ?? 'TODO',
                ),
              ),
            ),
          ),
          orElse: () => const SliverToBoxAdapter(),
        );
      },
    );
  }
}

class _MessageListView extends StatefulWidget {
  final List<ChatMessage> messages;
  final Widget Function(ChatMessage, int)? messageBuilder;

  final Widget Function(String)? dateBuilder;
  final bool inverted;
  const _MessageListView({
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
                    : const SizedBox.shrink(),
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
  const _DateBuilder({
    required this.date,
  });

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    //TODO
    // final text = date.toIso8601String();
    final text =
        DateFormat('d. MMM${date.year != DateTime.now().year ? ' yyyy' : ''}')
            .format(date);
    return Center(
      child:
          // Padding(
          //   // padding: kPadVertMedium,
          //   child:
          Text(
        text,
        // style: kTextListItem,
      ),
      // ),
    );
  }
}
