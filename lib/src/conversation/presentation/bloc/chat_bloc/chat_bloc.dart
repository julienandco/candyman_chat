import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

import 'package:neon_chat/src/conversation/conversation.dart';
import 'package:neon_chat/src/conversations/conversations.dart';
import 'package:neon_chat/src/core/core.dart';

part 'chat_state.dart';
part 'chat_event.dart';
part 'chat_bloc.freezed.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  String? _conversationId;
  String? _otherUserProfileId;

  final FirebaseAuth firebaseAuth;
  late final StreamSubscription _chatStream;

  final HideMessageUC hideMessageUC;
  final DeleteMessageUC deleteMessageUC;
  final MarkMessageAsSeenUC markAsSeenUC;
  final SendPlatformFileMessageUC sendPlatformFileMessageUC;
  final SendFileMessageUC sendFileMessageUC;
  final SendTextMessageUC sendTextMessageUC;
  final InitializeConversationStreamUC initStreamUC;

  ChatBloc({
    required this.firebaseAuth,
    required this.hideMessageUC,
    required this.deleteMessageUC,
    required this.markAsSeenUC,
    required this.sendPlatformFileMessageUC,
    required this.sendFileMessageUC,
    required this.sendTextMessageUC,
    required this.initStreamUC,
  }) : super(const _Initial()) {
    on<ChatEvent>((event, emit) {
      event.when(
        init: (conversationId, userProfileId) {
          _conversationId = conversationId;
          _otherUserProfileId = userProfileId;

          _chatStream = initStreamUC(
            conversationId: conversationId,
            otherUserProfileId: userProfileId,
            combiner: (
              Conversation conversation,
              List<ChatMessage> messages,
              FirebaseUser userProfile,
            ) =>
                _OnData(
              messages,
              userProfile,
              conversation,
            ),
            onData: (onDataEvent) => add(onDataEvent),
          );
        },
        onData: (messages, userProfile, conversation) => emit(
          ChatState.loadSuccess(
            messages: messages,
            userProfile: userProfile,
            conversation: conversation,
          ),
        ),
        sendTextMessage: (message) {
          state.maybeMap(
            loadSuccess: (state) {
              if (message.trim().isNotEmpty) {
                sendTextMessageUC(
                  conversationId: state.conversation.id,
                  message: ChatMessage(
                    senderId: firebaseAuth.currentUser!.uid,
                    type: ChatMessageType.text,
                    text: message,
                  ),
                );
              }
            },
            orElse: () {},
          );
        },
        sendVoiceMessage: (messageString, duration) {
          state.maybeMap(
            loadSuccess: (state) {
              sendFileMessageUC(
                conversationId: state.conversation.id,
                senderId: firebaseAuth.currentUser!.uid,
                type: ChatMessageType.voice,
                filePath: messageString,
                duration: duration,
                reparseFilePath: true,
              );
            },
            orElse: () {},
          );
        },
        sendImageMessage: (messageString) {
          state.maybeMap(
            loadSuccess: (state) {
              sendFileMessageUC(
                conversationId: state.conversation.id,
                senderId: firebaseAuth.currentUser!.uid,
                type: ChatMessageType.image,
                filePath: messageString,
              );
            },
            orElse: () {},
          );
        },
        sendVideoMessage: (messageString) {
          state.maybeMap(
            loadSuccess: (state) {
              sendFileMessageUC(
                conversationId: state.conversation.id,
                senderId: firebaseAuth.currentUser!.uid,
                type: ChatMessageType.video,
                filePath: messageString,
              );
            },
            orElse: () {},
          );
        },
        sendMultipleFiles: (files) async {
          await state.maybeMap(
            loadSuccess: (state) async {
              ChatMessageType type;

              for (var asset in files) {
                final file = await asset.file;
                switch (asset.type) {
                  case AssetType.image:
                    type = ChatMessageType.image;
                    break;
                  case AssetType.video:
                    type = ChatMessageType.video;
                    break;
                  default:
                    type = ChatMessageType.file;
                }

                sendFileMessageUC(
                  conversationId: state.conversation.id,
                  senderId: firebaseAuth.currentUser!.uid,
                  type: type,
                  filePath: file!.path,
                );
              }
            },
            orElse: () {},
          );
        },
        sendFileMessage: (file) {
          state.maybeMap(
            loadSuccess: (state) {
              sendPlatformFileMessageUC(
                conversationId: state.conversation.id,
                senderId: firebaseAuth.currentUser!.uid,
                file: file,
              );
            },
            orElse: () {},
          );
        },
        markAsSeen: (message) {
          state.maybeMap(
            loadSuccess: (state) {
              markAsSeenUC(
                  conversationId: state.conversation.id, message: message);
            },
            orElse: () {},
          );
        },
        deleteMessage: (message) {
          if (_isInit) {
            deleteMessageUC(conversationId: _conversationId!, message: message);
          }
        },
        hideMessage: (message) {
          if (_isInit) {
            hideMessageUC(conversationId: _conversationId!, message: message);
          }
        },
      );
    });
  }

  bool get _isInit => _conversationId != null && _otherUserProfileId != null;

  @override
  Future<void> close() {
    _chatStream.cancel();
    return super.close();
  }
}
