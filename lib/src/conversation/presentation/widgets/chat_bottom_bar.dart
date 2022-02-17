import 'dart:developer';

import 'package:file_picker/file_picker.dart';
import 'package:animator/animator.dart' as animator;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';
import 'package:wechat_camera_picker/wechat_camera_picker.dart';

//TODO: imports
import 'package:neon_chat/src/conversation/presentation/bloc/chat_bloc/chat_bloc.dart';
import 'package:neon_chat/src/core/presentation/widgets/base_circle_button.dart';

import 'buttons/buttons.dart';

const kMaxWidth = 800.0;

class ChatBottomBar extends StatefulWidget {
  final Color chatBarColor;
  final BorderRadius borderRadius;
  final bool isWebOrMacOS;
  final Color assetPickerColor;
  final Color cameraPickerColor;
  final BoxConstraints constraints;
  final EdgeInsets padding;
  final double? maxWidth;
  final Widget galleryIcon;
  final Color galleryIconColor;
  final double galleryIconSize;
  final Widget galleryIconLabel;
  final Widget mediaPickerIcon;
  final Color mediaPickerIconColor;
  final double mediaPickerIconSize;
  final Widget mediaPickerIconLabel;
  final Widget audioMessageIcon;
  final TextStyle? audioRecordingLabelStyle;
  final TextStyle? textFieldStyle;
  final InputDecoration? textFieldDecoration;
  final Widget attachmentIcon;
  final Widget cameraIcon;
  final Widget sendIcon;
  final double sendIconSize;

  const ChatBottomBar({
    Key? key,
    this.chatBarColor = Colors.black,
    this.borderRadius = const BorderRadius.all(Radius.circular(15)),
    required this.isWebOrMacOS,
    this.assetPickerColor = Colors.red,
    this.cameraPickerColor = Colors.red,
    this.constraints = const BoxConstraints(maxWidth: kMaxWidth),
    this.padding = const EdgeInsets.symmetric(horizontal: 15),
    this.maxWidth,
    required this.galleryIcon,
    required this.galleryIconColor,
    this.galleryIconSize = 40,
    required this.galleryIconLabel,
    required this.mediaPickerIcon,
    required this.mediaPickerIconColor,
    this.mediaPickerIconSize = 40,
    required this.mediaPickerIconLabel,
    required this.audioMessageIcon,
    this.audioRecordingLabelStyle,
    this.textFieldStyle,
    this.textFieldDecoration,
    required this.attachmentIcon,
    required this.cameraIcon,
    required this.sendIcon,
    this.sendIconSize = 46,
  }) : super(key: key);

  @override
  _ChatBottomBarState createState() => _ChatBottomBarState();
}

class _ChatBottomBarState extends State<ChatBottomBar> {
  final TextEditingController _textController = TextEditingController();
  final bool _bottomBarIsHidden = false;
  late bool _showSentButton;
  bool _showAttachOptions = false;
  bool _isRecordingAudio = false;
  String _recordingSeconds = '';
  String _recordingMinutes = '';
  int _recordingSec = 0;
  StopWatchTimer? _recordTimer;
  late double _maxWidth;

  void _onTimerChange(int secs) {
    setState(() {
      _recordingSec = secs;
      _recordingMinutes = StopWatchTimer.getDisplayTimeMinute(secs * 1000);
      _recordingSeconds = StopWatchTimer.getDisplayTimeSecond(secs * 1000);
    });
  }

  @override
  void initState() {
    _textController.addListener(_onTextChanged);
    _showSentButton = widget.isWebOrMacOS;
    if (widget.maxWidth == null) {
      _maxWidth = MediaQuery.of(context).size.width > kMaxWidth
          ? kMaxWidth
          : MediaQuery.of(context).size.width;
    } else {
      _maxWidth = widget.maxWidth!;
    }
    _recordTimer = StopWatchTimer(
      mode: StopWatchMode.countUp,
      onChangeRawSecond: _onTimerChange,
    );
    super.initState();
  }

  @override
  void dispose() {
    _textController.removeListener(_onTextChanged);
    _textController.dispose();
    _recordTimer?.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    final value = _textController.text;
    setState(() {
      _showAttachOptions = false;
      if (!widget.isWebOrMacOS) _showSentButton = value.isNotEmpty;
    });
  }

  void _sendTextMessage(String content) {
    _textController.clear();

    context.read<ChatBloc>().add(ChatEvent.sendTextMessage(content));
  }

  void _sendImageMessage(String imagePath) {
    context.read<ChatBloc>().add(ChatEvent.sendImageMessage((imagePath)));
  }

  void _sendVideoMessage(String videoPath) {
    context.read<ChatBloc>().add(ChatEvent.sendVideoMessage(videoPath));
  }

  void _sendMultipleFiles(List<AssetEntity> files) {
    context.read<ChatBloc>().add(ChatEvent.sendMultipleFiles(files));
  }

  void _sendAudioMessage(String audioPath, Duration duration) {
    if (duration.inSeconds > 0) {
      context
          .read<ChatBloc>()
          .add(ChatEvent.sendVoiceMessage(audioPath, duration));
    }
  }

  void _sendFileMessage(PlatformFile filePath) {
    context.read<ChatBloc>().add(ChatEvent.sendFileMessage(filePath));
  }
  // void _openCameraView() async {
  //   setState(() {
  //     _showAttachOptions = false;
  //   });
  //   final mediaData =
  //       await getIt<CameraPickerService>().getMediaItemFromCamera(context);
  //   if (mediaData != null) {
  //     _openMediaPreviewPage(mediaData.mediaType, mediaData.bytes);
  //   }
  // }

  // void _openMediaPreviewPage(PapeoMediaType mediaType, File file) async {
  // if (mediaType == PapeoMediaType.Image) {
  //   _sendImageMessage(file.path);
  // } else if (mediaType == PapeoMediaType.Video) {
  //   _sendVideoMessage(file.path);
  // }
  // setState(() {
  //   _bottomBarIsHidden = true;
  // });
  // final shouldSend = await showDialog<bool>(
  //   barrierDismissible: false,
  //   context: context,
  //   builder: (context) => CameraPreviewPage(
  //     mediaType: mediaType,
  //     mediaData: file.readAsBytesSync(),
  //   ),
  // );
  // setState(() {
  //   _bottomBarIsHidden = false;
  // });
  // if (shouldSend ?? false) {}
  // }

  void _toggleShowAttachOptions() {
    setState(() {
      _showAttachOptions = !_showAttachOptions;
    });
  }

  void _openMediaPickerPage() async {
    setState(() {
      _showAttachOptions = false;
    });
    final List<AssetEntity> assets = await AssetPicker.pickAssets(context,
            maxAssets: 3,
            requestType: RequestType.common,
            textDelegate: GermanTextDelegate(),
            pickerTheme: AssetPicker.themeData(widget.assetPickerColor)) ??
        [];
    _sendMultipleFiles(assets);
  }

  void _takePhotoFromCamera() async {
    try {
      final AssetEntity? file = await CameraPicker.pickFromCamera(
        context,
        textDelegate: EnglishCameraPickerTextDelegate(),
        enableRecording: true,
        theme: CameraPicker.themeData(widget.cameraPickerColor),
        resolutionPreset: ResolutionPreset.medium,
      );

      if (file != null) {
        final content = await file.file;

        if (file.type == AssetType.image) {
          _sendImageMessage(content!.path);
        } else if (file.type == AssetType.video) {
          _sendVideoMessage(content!.path);
        }
      }
    } catch (e) {
      log('$e', name: '$runtimeType');
      rethrow;
    }
  }

  void _pickFile() async {
    setState(() {
      _showAttachOptions = false;
    });
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      _sendFileMessage(result.files.first);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: widget.constraints,
        child: AnimatedOpacity(
          opacity: _bottomBarIsHidden ? 0 : 1,
          duration: const Duration(milliseconds: 250),
          child: Material(
            color: Colors.transparent,
            child: Padding(
              padding: widget.padding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (_showAttachOptions)
                    BounceInRight(
                      preferences: const AnimationPreferences(
                        offset: Duration(milliseconds: 200),
                        duration: Duration(milliseconds: 250),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(width: _maxWidth - 202),
                          BaseCircleButton(
                            child: widget.galleryIcon,
                            color: widget.galleryIconColor,
                            size: widget.galleryIconSize,
                            backgroundOpacity: 1,
                            padding: const EdgeInsets.all(10),
                            withShadow: true,
                            onTap: _pickFile,
                          ),
                          const SizedBox(width: 10),
                          widget.galleryIconLabel,
                        ],
                      ),
                    ),
                  const SizedBox(height: 10),
                  if (_showAttachOptions)
                    BounceInRight(
                      preferences: const AnimationPreferences(
                        offset: Duration(milliseconds: 100),
                        duration: Duration(milliseconds: 250),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(width: _maxWidth - 202),
                          BaseCircleButton(
                            child: widget.mediaPickerIcon,
                            color: widget.mediaPickerIconColor,
                            size: widget.mediaPickerIconSize,
                            backgroundOpacity: 1,
                            padding: const EdgeInsets.all(10),
                            onTap: _openMediaPickerPage,
                            withShadow: true,
                          ),
                          const SizedBox(width: 10),
                          widget.mediaPickerIconLabel,
                        ],
                      ),
                    ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: widget.chatBarColor,
                            borderRadius: widget.borderRadius,
                          ),
                          child: Stack(
                            children: [
                              AnimatedOpacity(
                                opacity: _isRecordingAudio ? 1 : 0,
                                duration: const Duration(milliseconds: 250),
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Row(
                                    children: [
                                      animator.Animator<double>(
                                        tween: Tween(begin: 0.0, end: 1.0),
                                        duration: const Duration(seconds: 1),
                                        cycles: 0,
                                        builder:
                                            (context, animatorState, child) =>
                                                Opacity(
                                          opacity: animatorState.value,
                                          child: widget.audioMessageIcon,
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(height: 38),
                                      ),
                                      Text(
                                        '$_recordingMinutes:$_recordingSeconds',
                                        style: widget.audioRecordingLabelStyle
                                            ?.copyWith(color: Colors.red),
                                      ),
                                      const SizedBox(width: 10),
                                    ],
                                  ),
                                ),
                              ),
                              AnimatedOpacity(
                                opacity: _isRecordingAudio ? 0 : 1,
                                duration: const Duration(milliseconds: 250),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        maxLines: 5,
                                        minLines: 1,
                                        textInputAction: TextInputAction.send,
                                        textCapitalization:
                                            TextCapitalization.sentences,
                                        controller: _textController,
                                        style: widget.textFieldStyle,
                                        onSubmitted: (value) {
                                          _sendTextMessage(value);
                                        },
                                        decoration: widget.textFieldDecoration,
                                      ),
                                    ),
                                    IconButton(
                                      icon: widget.attachmentIcon,
                                      onPressed: widget.isWebOrMacOS
                                          ? _toggleShowAttachOptions
                                          : _pickFile,
                                    ),
                                    if (!widget.isWebOrMacOS)
                                      IconButton(
                                        icon: widget.cameraIcon,
                                        onPressed: _takePhotoFromCamera,
                                      ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      _showSentButton
                          ? ChatCircleButton(
                              child: widget.sendIcon,
                              size: widget.sendIconSize,
                              onTap: () {
                                if (_showSentButton) {
                                  _sendTextMessage(_textController.text);
                                }
                              },
                            )
                          : AudioRecordButton(
                              onRecordStart: () {
                                _recordTimer?.onExecute
                                    .add(StopWatchExecute.reset);
                                _recordTimer?.onExecute
                                    .add(StopWatchExecute.start);
                                setState(() {
                                  _isRecordingAudio = true;
                                  _showAttachOptions = false;
                                });
                              },
                              onRecordEnd: (filePath) {
                                _sendAudioMessage(
                                  filePath!,
                                  Duration(seconds: _recordingSec),
                                );

                                _recordTimer?.onExecute
                                    .add(StopWatchExecute.stop);
                                _recordTimer?.onExecute
                                    .add(StopWatchExecute.reset);
                                setState(() {
                                  _isRecordingAudio = false;
                                });
                              },
                            ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
