library neon_chat;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:neon_chat/src/conversation/conversation.dart';
import 'package:neon_chat/src/conversations/conversations.dart';
import 'package:neon_chat/src/core/data/repositories/firebase_user_profile_repository_impl.dart';
import 'package:neon_chat/src/neon_chat_setup_options.dart';

export 'src/conversation/conversation.dart' show ChatMessage;
export 'src/conversations/conversations.dart'
    show Conversation, ConversationItem;
export 'src/core/core.dart' show FirebaseUser;
export 'src/presentation/presentation.dart';

part 'src/neon_chat_impl.dart';

//TODO
const isWebOrMacOS = false;
