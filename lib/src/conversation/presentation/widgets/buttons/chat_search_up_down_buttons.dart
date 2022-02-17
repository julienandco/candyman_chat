import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//TODO: imports
import 'package:neon_chat/src/conversation/presentation/bloc/chat_search_bloc/chat_search_bloc.dart';

class ChatSearchUpDown extends StatelessWidget {
  final EdgeInsets padding;
  final EdgeInsets betweenButtonsPadding;
  final Widget? goUpIcon;
  final Widget? goDownIcon;
  const ChatSearchUpDown({
    Key? key,
    this.padding = const EdgeInsets.all(15),
    this.betweenButtonsPadding = const EdgeInsets.symmetric(vertical: 15),
    this.goUpIcon,
    this.goDownIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Align(
        alignment: Alignment.bottomRight,
        child: SafeArea(
          child: BlocBuilder<ChatSearchBloc, ChatSearchState>(
            builder: (context, state) {
              if (state.isSearchActive && state.messageIndices.isNotEmpty) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    (state.canGoResultUp)
                        ? IconButton(
                            iconSize: 35,
                            icon: goUpIcon ??
                                const Icon(
                                  Icons.arrow_circle_up_outlined,
                                  color: Colors.white,
                                ),
                            onPressed: () => context
                                .read<ChatSearchBloc>()
                                .add(const ChatSearchEvent.onGoResultUp()),
                          )
                        : const SizedBox(
                            height: 35,
                          ),
                    Padding(padding: betweenButtonsPadding),
                    (state.canGoResultDown)
                        ? IconButton(
                            iconSize: 35,
                            icon: goDownIcon ??
                                const Icon(
                                  Icons.arrow_circle_down_outlined,
                                  color: Colors.white,
                                ),
                            onPressed: () => context
                                .read<ChatSearchBloc>()
                                .add(const ChatSearchEvent.onGoResultDown()),
                          )
                        : const SizedBox(
                            height: 35,
                          ),
                  ],
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ),
      ),
    );
  }
}
