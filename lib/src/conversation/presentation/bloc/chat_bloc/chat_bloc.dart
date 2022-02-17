import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

import 'package:neon_chat/src/conversation/conversation.dart';
import 'package:neon_chat/src/conversations/conversations.dart';
import 'package:neon_chat/src/core/core.dart';

part 'chat_state.dart';
part 'chat_event.dart';
part 'chat_bloc.freezed.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc({
    required this.conversationId,
    required this.userProfileId,
    required this.firebaseAuth,
    required this.chatRepository,
    required this.conversationRepository,
    required this.chatUploadManagerRepository,
    required this.userProfileRepository,
  }) : super(const _Initial()) {
    _chatStream = CombineLatestStream.combine3(
      conversationRepository.getConversation(conversationId),
      chatRepository.getMessages(conversationId),
      userProfileRepository.getUserProfile(userProfileId),
      (
        Conversation conversation,
        List<ChatMessage> messages,
        FirebaseUser userProfile,
      ) =>
          _OnData(
        messages,
        userProfile,
        conversation,
      ),
    ).listen(
      (onDataEvent) => add(onDataEvent),
    );
    on<ChatEvent>((event, emit) {
      event.when(
        init: () {
          //TODO: unnecessary event?
          // _chatStream = CombineLatestStream.combine3(
          //   conversationRepository.getConversation(conversationId),
          //   chatRepository.getMessages(conversationId),
          //   userProfileRepository.getUserProfile(userProfileId),
          //   (
          //     ConversationModel conversation,
          //     List<ChatMessageModel> messages,
          //     FirebaseUser userProfile,
          //   ) =>
          //       _OnData(
          //     messages,
          //     userProfile,
          //     conversation,
          //   ),
          // ).listen(
          //   (onDataEvent) => add(onDataEvent),
          // );
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
                //TODO: UC
                chatRepository.sendMessage(
                  state.conversation.id,
                  ChatMessage(
                    senderId: firebaseAuth.currentUser!.uid,
                    receiverId: state.conversation.receiverId,
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
                final filePath = Uri.parse(messageString).path;

                //TODO: UC
                final message = chatRepository.sendFileMessage(
                  state.conversation.id,
                  ChatMessage(
                    senderId: firebaseAuth.currentUser!.uid,
                    receiverId: state.conversation.receiverId,
                    type: ChatMessageType.voice,
                    filePath: messageString,
                    audioDuration: duration,
                  ),
                );
                chatUploadManagerRepository
                    .upload(message.copyWith(filePath: filePath));
              },
              orElse: () {});
        },
        sendImageMessage: (messageString) {
          state.maybeMap(
            loadSuccess: (state) {
              //TODO: UC
              final message = chatRepository.sendFileMessage(
                state.conversation.id,
                ChatMessage(
                  senderId: firebaseAuth.currentUser!.uid,
                  receiverId: state.conversation.receiverId,
                  type: ChatMessageType.image,
                  filePath: messageString,
                ),
              );
              chatUploadManagerRepository.upload(message);
            },
            orElse: () {},
          );
        },
        //TODO: async needed?
        sendVideoMessage: (messageString) async {
          await state.maybeMap(
            loadSuccess: (state) async {
              //TODO: UC
              final message = chatRepository.sendFileMessage(
                state.conversation.id,
                ChatMessage(
                  senderId: firebaseAuth.currentUser!.uid,
                  receiverId: state.conversation.receiverId,
                  type: ChatMessageType.video,
                  filePath: messageString,
                ),
              );
              chatUploadManagerRepository.upload(message);
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

                //TODO: UC
                final message = chatRepository.sendFileMessage(
                  state.conversation.id,
                  ChatMessage(
                    senderId: firebaseAuth.currentUser!.uid,
                    receiverId: state.conversation.receiverId,
                    type: type,
                    filePath: file!.path,
                  ),
                );
                chatUploadManagerRepository.upload(message);
              }
            },
            orElse: () {},
          );
        },
        //TODO: async needed?
        sendFileMessage: (file) async {
          await state.maybeMap(
            loadSuccess: (state) async {
              ChatMessageType type;
              switch (file.extension) {
                case 'png':
                case 'gif':
                case 'bmp':
                case 'jpeg':
                case 'jpg':
                  type = ChatMessageType.image;
                  break;
                case 'mov':
                case 'mp4':
                  type = ChatMessageType.video;
                  break;

                default:
                  type = ChatMessageType.file;
              }

              //TODO: UC
              final message = chatRepository.sendFileMessage(
                state.conversation.id,
                ChatMessage(
                  senderId: firebaseAuth.currentUser!.uid,
                  receiverId: state.conversation.receiverId,
                  type: type,
                  filePath: !kIsWeb ? file.path : '',
                  text: file.name,
                ),
              );
              chatUploadManagerRepository.upload(
                message.copyWith(
                  platformFile: file,
                ),
              );
            },
            orElse: () {},
          );
        },
        markAsSeen: (message) {
          state.maybeMap(
            loadSuccess: (state) {
              //TODO: UC
              chatRepository.markAsSeen(
                state.conversation.id,
                message,
              );
            },
            orElse: () {},
          );
        },
        deleteMessage: (message) {
          //TODO: UC
          chatRepository.deleteMessage(conversationId, message);
        },
        hideMessage: (message) {
          //TODO: UC
          chatRepository.hideMessage(conversationId, message);
        },
      );
    });
  }
  final String conversationId;
  final String userProfileId;

  final FirebaseAuth firebaseAuth;
  final ChatRepository chatRepository;
  final ConversationRepository conversationRepository;
  final ChatUploadManagerRepository chatUploadManagerRepository;
  final FirebaseUserProfileRepository userProfileRepository;
  late final StreamSubscription _chatStream;

  // void init() => add(_Init());
  // void sendTextMessage(String message) => add(_SendTextMessage(message));

  // void sendVoiceMessage(String message, Duration duration) => add(
  //       _SendVoiceMessage(
  //         message,
  //         duration,
  //       ),
  //     );

  // void sendImageMessage(String message) => add(_SendImageMessage(message));
  // void sendVideoMessage(String message) => add(_SendVideoMessage(message));
  // void sendMultipleFiles(List<AssetEntity> files) =>
  //     add(_SendMultipleFiles(files));
  // void sendFileMessage(PlatformFile file) => add(_SendFileMessage(file));

  // void markAsSeen(ChatMessageModel message) => add(_MarkAsSeen(message));
  // void hideMessage(ChatMessageModel message) => add(_HideMessage(message));
  // void deleteMessage(ChatMessageModel message) => add(_DeleteMessage(message));

  // @override
  // Stream<ChatState> mapEventToState(ChatEvent event) async* {
  //   yield* event.map(
  //     init: (_) async* {
  //       _chatStream = CombineLatestStream.combine3(
  //         conversationRepository.getConversation(conversationId),
  //         chatRepository.getMessages(conversationId),
  //         userProfileRepository.getUserProfile(userProfileId),
  //         (
  //           ConversationModel conversation,
  //           List<ChatMessageModel> messages,
  //           FirebaseUser userProfile,
  //         ) =>
  //             _OnData(
  //           messages,
  //           userProfile,
  //           conversation,
  //         ),
  //       ).listen(
  //         (onDataEvent) => add(onDataEvent),
  //       );
  //     },
  //     onData: (event) async* {
  //       Party? party;
  //       if (event.conversation.isPartyChat) {
  //         if (state is _LoadSuccess) {
  //           party = (state as _LoadSuccess).party;
  //         } else {
  //           party = (await partyRepository
  //                   .getPartyWithId(event.conversation.partyId!))
  //               .fold((l) {
  //             print(l);
  //             return null;
  //           }, (r) => r);
  //         }
  //       }
  //       yield ChatState.loadSuccess(
  //         messages: event.messages,
  //         userProfile: event.userProfile,
  //         conversation: event.conversation,
  //         party: party,
  //       );
  //     },
  //     sendTextMessage: (event) async* {
  //       state.maybeMap(
  //         loadSuccess: (state) {
  //           if (event.message.trim().isNotEmpty) {
  //             chatRepository.sendMessage(
  //               state.conversation.id,
  //               ChatMessageModel(
  //                 senderId: firebaseAuth.currentUser!.uid,
  //                 receiverId: state.conversation.receiverId,
  //                 type: ChatMessageType.text,
  //                 text: event.message,
  //               ),
  //             );
  //           }
  //         },
  //         orElse: () {},
  //       );
  //     },
  //     onPartyData: (event) async* {
  //       if (state is _LoadSuccess) {
  //         final currentState = state as _LoadSuccess;
  //         yield currentState.copyWith(
  //           party: event.party,
  //         );
  //       }
  //     },
  //     sendVoiceMessage: (event) async* {
  //       state.maybeMap(
  //           loadSuccess: (state) {
  //             final filePath = Uri.parse(event.message).path;
  //             final message = chatRepository.sendFileMessage(
  //               state.conversation.id,
  //               ChatMessageModel(
  //                 senderId: firebaseAuth.currentUser!.uid,
  //                 receiverId: state.conversation.receiverId,
  //                 type: ChatMessageType.voice,
  //                 filePath: event.message,
  //                 audioDuration: event.duration,
  //               ),
  //             );
  //             chatUploadManagerRepository
  //                 .upload(message.copyWith(filePath: filePath));
  //           },
  //           orElse: () {});
  //     },
  //     sendImageMessage: (event) async* {
  //       state.maybeMap(
  //         loadSuccess: (state) {
  //           final message = chatRepository.sendFileMessage(
  //             state.conversation.id,
  //             ChatMessageModel(
  //               senderId: firebaseAuth.currentUser!.uid,
  //               receiverId: state.conversation.receiverId,
  //               type: ChatMessageType.image,
  //               filePath: event.message,
  //             ),
  //           );
  //           chatUploadManagerRepository.upload(message);
  //         },
  //         orElse: () {},
  //       );
  //     },
  //     sendVideoMessage: (event) async* {
  //       await state.maybeMap(
  //         loadSuccess: (state) async {
  //           final message = chatRepository.sendFileMessage(
  //             state.conversation.id,
  //             ChatMessageModel(
  //               senderId: firebaseAuth.currentUser!.uid,
  //               receiverId: state.conversation.receiverId,
  //               type: ChatMessageType.video,
  //               filePath: event.message,
  //             ),
  //           );
  //           chatUploadManagerRepository.upload(message);
  //         },
  //         orElse: () {},
  //       );
  //     },
  //     sendMultipleFiles: (event) async* {
  //       await state.maybeMap(
  //         loadSuccess: (state) async {
  //           ChatMessageType type;

  //           for (var asset in event.files) {
  //             final file = await asset.file;
  //             switch (asset.type) {
  //               case AssetType.image:
  //                 type = ChatMessageType.image;
  //                 break;
  //               case AssetType.video:
  //                 type = ChatMessageType.video;

  //                 break;

  //               default:
  //                 type = ChatMessageType.file;
  //             }
  //             final message = chatRepository.sendFileMessage(
  //               state.conversation.id,
  //               ChatMessageModel(
  //                 senderId: firebaseAuth.currentUser!.uid,
  //                 receiverId: state.conversation.receiverId,
  //                 type: type,
  //                 filePath: file!.path,
  //               ),
  //             );
  //             chatUploadManagerRepository.upload(message);
  //           }
  //         },
  //         orElse: () {},
  //       );
  //     },
  //     sendFileMessage: (event) async* {
  //       await state.maybeMap(
  //         loadSuccess: (state) async {
  //           ChatMessageType type;
  //           switch (event.file.extension) {
  //             case 'png':
  //             case 'gif':
  //             case 'bmp':
  //             case 'jpeg':
  //             case 'jpg':
  //               type = ChatMessageType.image;
  //               break;
  //             case 'mov':
  //             case 'mp4':
  //               type = ChatMessageType.video;
  //               break;

  //             default:
  //               type = ChatMessageType.file;
  //           }
  //           final message = chatRepository.sendFileMessage(
  //             state.conversation.id,
  //             ChatMessageModel(
  //               senderId: firebaseAuth.currentUser!.uid,
  //               receiverId: state.conversation.receiverId,
  //               type: type,
  //               filePath: !kIsWeb ? event.file.path : '',
  //               text: event.file.name,
  //             ),
  //           );
  //           chatUploadManagerRepository.upload(
  //             message.copyWith(
  //               platformFile: event.file,
  //             ),
  //           );
  //         },
  //         orElse: () {},
  //       );
  //     },
  //     markAsSeen: (event) async* {
  //       state.maybeMap(
  //         loadSuccess: (state) {
  //           chatRepository.markAsSeen(
  //             state.conversation.id,
  //             event.message,
  //           );
  //         },
  //         orElse: () {},
  //       );
  //     },
  //     deleteMessage: (event) async* {
  //       chatRepository.deleteMessage(conversationId, event.message);
  //     },
  //     hideMessage: (event) async* {
  //       chatRepository.hideMessage(conversationId, event.message);
  //     },
  //   );
  // }

  @override
  Future<void> close() {
    _chatStream.cancel();
    return super.close();
  }
}
