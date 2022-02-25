library neon_chat;

import 'package:flutter/foundation.dart'
    show TargetPlatform, defaultTargetPlatform, kIsWeb;

//TODO: passende show statements einbauen

export 'src/conversation/conversation.dart'; // show ChatMessage;
export 'src/conversations/conversations.dart';
//show Conversation, ConversationItem;
export 'src/core/core.dart'; // show FirebaseUser;
export 'src/presentation/presentation.dart';

bool get isWebOrMacOS =>
    kIsWeb || defaultTargetPlatform == TargetPlatform.macOS;
