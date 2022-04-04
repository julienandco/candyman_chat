import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

import 'package:neon_chat/src/conversation/conversation.dart';
import 'package:neon_chat/src/conversations/conversations.dart';

part 'conversation_state.dart';
part 'conversation_event.dart';
part 'conversation_bloc.freezed.dart';

class ConversationBloc extends Bloc<ConversationEvent, ConversationState> {
  String? _conversationId;

  final FirebaseAuth firebaseAuth;
  late final StreamSubscription _chatStream;

  final HideMessageUC hideMessageUC;
  final DeleteMessageUC deleteMessageUC;
  final MarkMessageAsSeenUC markAsSeenUC;
  final MarkGroupMessageAsSeenUC markGroupMessageAsSeenUC;
  final SendPlatformFileMessageUC sendPlatformFileMessageUC;
  final SendFileMessageUC sendFileMessageUC;
  final SendTextMessageUC sendTextMessageUC;
  final InitializeConversationStreamUC initStreamUC;

  ConversationBloc({
    required this.firebaseAuth,
    required this.hideMessageUC,
    required this.deleteMessageUC,
    required this.markAsSeenUC,
    required this.markGroupMessageAsSeenUC,
    required this.sendPlatformFileMessageUC,
    required this.sendFileMessageUC,
    required this.sendTextMessageUC,
    required this.initStreamUC,
  }) : super(const _Initial()) {
    on<ConversationEvent>((event, emit) {
      event.when(
        init: (conversationItem) {
          _conversationId = conversationItem.conversation.id;

          _chatStream = initStreamUC(
            conversationId: conversationItem.conversation.id,
            combiner: (
              List<ChatMessage> messages,
            ) =>
                _OnData(
              messages,
              conversationItem.conversation,
              conversationItem.conversation.displayName,
              conversationItem.groupConversationLastSeenTimestamp,
            ),
            onData: (onDataEvent) => add(onDataEvent),
          );
        },
        onData: (messages, conversation, displayName, timestamp) => emit(
          ConversationState.loadSuccess(
            messages: messages,
            conversation: conversation,
            displayName: displayName,
            groupConversationLastSeenTimestamp: timestamp,
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
        markGroupMessageAsSeen: (message) {
          state.maybeMap(
            loadSuccess: (state) {
              markGroupMessageAsSeenUC(
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

  bool get _isInit => _conversationId != null;

  @override
  Future<void> close() {
    _chatStream.cancel();
    return super.close();
  }
}
