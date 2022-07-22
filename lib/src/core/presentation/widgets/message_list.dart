import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:neon_chat/src/chat_init.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:neon_chat/neon_chat.dart';

class MessageList extends StatelessWidget {
  final Conversation conversation;

  final void Function(DateTime) updateLastSeenTimestampForConversation;

  const MessageList({
    Key? key,
    required this.conversation,
    required this.updateLastSeenTimestampForConversation,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConversationBloc, ConversationState>(
      builder: (context, state) {
        return state.maybeMap(
          loadSuccess: (state) => _MessageListView(
            messages: state.messages,
            messageBuilder: (ConversationMessage message, int index) =>
                AutoScrollTag(
              key: ValueKey(message.id),
              index: index,
              controller:
                  context.read<ConversationSearchBloc>().messageListController,
              child: Container(
                margin: const EdgeInsets.only(bottom: 8),
                child: MessageBubble(
                  updateLastSeenTimestampForGroupConvo:
                      updateLastSeenTimestampForConversation,
                  groupChatLastSeenTimestamp: conversation is GroupConversation
                      ? (conversation as GroupConversation).lastSeen
                      : null,
                  isGroupChat: state.conversation is GroupConversation,
                  message: message,
                  otherUserName: _getOtherUsernameForUserID(message.senderId),
                ),
              ),
            ),
          ),
          orElse: () => const SliverToBoxAdapter(),
        );
      },
    );
  }

  String _getOtherUsernameForUserID(String userID) {
    final convo = conversation;
    if (convo is GroupConversation) {
      final user = convo.conversationMembers
          .firstWhere((element) => element.id == userID);
      return user.username;
    } else if (convo is DirectConversation) {
      return convo.conversationPartner.username;
    } else {
      throw UnknownConversationType();
    }
  }
}

class _MessageListView extends StatefulWidget {
  final List<ConversationMessage> messages;
  final Widget Function(ConversationMessage, int)? messageBuilder;
  const _MessageListView({
    required this.messages,
    this.messageBuilder,
  });

  @override
  _MessageListViewState createState() => _MessageListViewState();
}

class _MessageListViewState extends State<_MessageListView> {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, i) {
          final timestamp = widget.messages[i].timestamp ?? DateTime.now();
          bool last = false;
          bool first = false;
          bool showDate = false;

          if (i == 0) {
            //we inverted the list, remember?
            last = true;
          }

          if (i == widget.messages.length - 1) {
            first = true;
          }

          DateTime? nextTimestamp;
          if (!last && !first) {
            nextTimestamp = widget.messages[i + 1].timestamp;
          }

          DateTime messageDate = DateTime(
            timestamp.year,
            timestamp.month,
            timestamp.day,
          );

          DateTime previousMessageDate = nextTimestamp == null
              ? DateTime.now().add(const Duration(days: 1))
              : DateTime(
                  nextTimestamp.year, nextTimestamp.month, nextTimestamp.day);

          if (previousMessageDate.isBefore(messageDate) || first) {
            showDate = true;
          }

          return Align(
            child: Column(
              children: <Widget>[
                if (showDate)
                  chatGetIt<WidgetInitData>()
                          .conversationDateSeparatorBuilder
                          ?.call(messageDate) ??
                      _DateBuilder(
                        date: messageDate,
                      ),
                widget.messageBuilder != null
                    ? widget.messageBuilder!(widget.messages[i], i)
                    : const SizedBox.shrink(),
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
    final text = DateFormat(
            'd. MMM${date.year != DateTime.now().year ? ' yyyy' : ''}',
            chatGetIt<String>(instanceName: kLocaleInstanceName))
        .format(date);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: const BorderRadius.all(Radius.circular(25))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
