library neon_chat;

import 'package:neon_chat/src/conversation/presentation/bloc/chat_bloc/chat_bloc.dart';
import 'package:neon_chat/src/conversation/presentation/bloc/chat_search_bloc/chat_search_bloc.dart';
import 'package:neon_chat/src/conversations/presentation/bloc/conversations_bloc/conversations_bloc.dart';
import 'package:neon_chat/src/conversations/presentation/bloc/conversations_search_bloc/conversations_search_bloc.dart';
import 'package:neon_chat/src/neon_chat_setup_options.dart';

export 'src/conversation/conversation.dart' show ChatMessage;
export 'src/conversations/conversations.dart'
    show Conversation, ConversationItem;
export 'src/core/core.dart' show FirebaseUser;
export 'src/presentation/presentation.dart';

part 'src/neon_chat_impl.dart';

//TODO
const isWebOrMacOS = false;
