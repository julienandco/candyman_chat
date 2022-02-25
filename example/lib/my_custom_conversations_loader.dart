import 'package:example/my_custom_conversations_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neon_chat/neon_chat.dart';

import 'injection/injection.dart';

class MyCustomConversationsLoader extends StatelessWidget {
  const MyCustomConversationsLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<ConversationsSearchBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<CurrentConversationCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<ConversationsBloc>(),
        ),
      ],
      child: Builder(builder: (context) {
        return MultiBlocListener(
          listeners: [
            BlocListener<ConversationsBloc, ConversationsState>(
              listener: (context, state) {
                state.maybeWhen(
                  loadSuccess: (conversations) {
                    context.read<ConversationsSearchBloc>().add(
                        ConversationsSearchEvent.initialize(conversations));
                    final currentConversationCubit =
                        context.read<CurrentConversationCubit>();
                    if (isWidthOverLimit(context) &&
                        currentConversationCubit.state.conversationId == null &&
                        conversations.isNotEmpty) {
                      final firstChat = conversations.first;
                      currentConversationCubit.onCurrentConversationChanged(
                          firstChat.conversationPartner.id,
                          firstChat.conversation.id);
                    }
                  },
                  orElse: () {},
                );
              },
            ),
          ],
          child: const Scaffold(
            body: MyCustomConversationsPage(),
          ),
        );
      }),
    );
  }
}
