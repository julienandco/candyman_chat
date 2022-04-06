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
  late final StreamSubscription _conversationStream;

  final HideMessageUC hideMessageUC;
  final DeleteMessageUC deleteMessageUC;
  final MarkMessageAsSeenUC markAsSeenUC;
  final SendPlatformFileMessageUC sendPlatformFileMessageUC;
  final SendFileMessageUC sendFileMessageUC;
  final SendTextMessageUC sendTextMessageUC;
  final InitializeConversationStreamUC initStreamUC;

  ConversationBloc({
    required this.firebaseAuth,
    required this.hideMessageUC,
    required this.deleteMessageUC,
    required this.markAsSeenUC,
    required this.sendPlatformFileMessageUC,
    required this.sendFileMessageUC,
    required this.sendTextMessageUC,
    required this.initStreamUC,
  }) : super(const _Initial()) {
    on<ConversationEvent>((event, emit) {
      event.when(
        init: (conversationItem) {
          _conversationId = conversationItem.conversation.id;

          _conversationStream = initStreamUC(
            conversationId: conversationItem.conversation.id,
            combiner: (
              List<ConversationMessage> messages,
            ) =>
                _OnData(
              messages,
              conversationItem.conversation,
              conversationItem.conversation.displayName,
            ),
            onData: (onDataEvent) => add(onDataEvent),
          );
        },
        onData: (messages, conversation, displayName) => emit(
          ConversationState.loadSuccess(
            messages: messages,
            conversation: conversation,
            displayName: displayName,
          ),
        ),
        sendTextMessage: (message) {
          state.maybeMap(
            loadSuccess: (state) {
              if (message.trim().isNotEmpty) {
                sendTextMessageUC(
                  conversationId: state.conversation.id,
                  message: ConversationMessage(
                    senderId: firebaseAuth.currentUser!.uid,
                    type: ConversationMessageType.text,
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
                type: ConversationMessageType.voice,
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
                type: ConversationMessageType.image,
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
                type: ConversationMessageType.video,
                filePath: messageString,
              );
            },
            orElse: () {},
          );
        },
        sendMultipleFiles: (files) async {
          await state.maybeMap(
            loadSuccess: (state) async {
              ConversationMessageType type;

              for (var asset in files) {
                final file = await asset.file;
                switch (asset.type) {
                  case AssetType.image:
                    type = ConversationMessageType.image;
                    break;
                  case AssetType.video:
                    type = ConversationMessageType.video;
                    break;
                  default:
                    type = ConversationMessageType.file;
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

  bool get _isInit => _conversationId != null;

  @override
  Future<void> close() {
    _conversationStream.cancel();
    return super.close();
  }
}
