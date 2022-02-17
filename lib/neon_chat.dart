library neon_chat;

import 'package:neon_chat/src/neon_chat_setup_options.dart';

export 'src/conversation/conversation.dart' show ChatBloc, ChatMessage;
export 'src/conversations/conversations.dart'
    show Conversation, ConversationItem;
export 'src/core/core.dart' show FirebaseUser;

part 'src/neon_chat_impl.dart';
part 'src/neon_chat_app.dart';

//TODO
const isWebOrMacOS = false;
