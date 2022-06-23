import 'dart:developer';

import 'package:file_picker/file_picker.dart';
import 'package:animator/animator.dart' as animator;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:neon_chat/neon_chat.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';
import 'package:wechat_camera_picker/wechat_camera_picker.dart';

class ConversationBottomBar extends StatefulWidget {
  final BottomBarStyle bottomBarStyle;

  const ConversationBottomBar({
    Key? key,
    required this.bottomBarStyle,
  }) : super(key: key);

  @override
  _ConversationBottomBarState createState() => _ConversationBottomBarState();
}

class _ConversationBottomBarState extends State<ConversationBottomBar> {
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
    _showSentButton = isWebOrMacOS;
    _recordTimer = StopWatchTimer(
      mode: StopWatchMode.countUp,
      onChangeRawSecond: _onTimerChange,
    );
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (widget.bottomBarStyle.maxWidth == null) {
      _maxWidth = isWidthOverLimit(context)
          ? kMaxWidth
          : MediaQuery.of(context).size.width;
    } else {
      _maxWidth = widget.bottomBarStyle.maxWidth!;
    }
    super.didChangeDependencies();
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
      _showSentButton = value.isNotEmpty;
    });
  }

  void _sendTextMessage(String content) {
    _textController.clear();
    context
        .read<ConversationBloc>()
        .add(ConversationEvent.sendTextMessage(content));
  }

  void _sendImageMessage(String imagePath) {
    context
        .read<ConversationBloc>()
        .add(ConversationEvent.sendImageMessage((imagePath)));
  }

  void _sendVideoMessage(String videoPath) {
    context
        .read<ConversationBloc>()
        .add(ConversationEvent.sendVideoMessage(videoPath));
  }

  void _sendMultipleFiles(List<AssetEntity> files) {
    context
        .read<ConversationBloc>()
        .add(ConversationEvent.sendMultipleFiles(files));
  }

  void _sendAudioMessage(String audioPath, Duration duration) {
    if (duration.inSeconds > 0) {
      context
          .read<ConversationBloc>()
          .add(ConversationEvent.sendVoiceMessage(audioPath, duration));
    }
  }

  void _sendFileMessage(PlatformFile filePath) {
    context
        .read<ConversationBloc>()
        .add(ConversationEvent.sendFileMessage(filePath));
  }

  //TODO
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
    setState(() => _showAttachOptions = !_showAttachOptions);
  }

  void _openMediaPickerPage() async {
    setState(() => _showAttachOptions = false);
    final List<AssetEntity>? assets = await AssetPicker.pickAssets(
      context,
      pickerConfig: AssetPickerConfig(
          maxAssets: 3,
          requestType: RequestType.common,
          pickerTheme:
              AssetPicker.themeData(widget.bottomBarStyle.assetPickerColor),
          textDelegate: const GermanAssetPickerTextDelegate()),
    );
    _sendMultipleFiles(assets ?? []);
  }

  void _takePhotoFromCamera() async {
    try {
      final AssetEntity? file = await CameraPicker.pickFromCamera(
        context,
        pickerConfig: CameraPickerConfig(
          enableRecording: true,
          theme:
              CameraPicker.themeData(widget.bottomBarStyle.cameraPickerColor),
          resolutionPreset: ResolutionPreset.medium,
          textDelegate: EnglishCameraPickerTextDelegate(),
        ),
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
    setState(() => _showAttachOptions = false);

    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      _sendFileMessage(result.files.first);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: widget.bottomBarStyle.constraints,
        child: AnimatedOpacity(
          opacity: _bottomBarIsHidden ? 0 : 1,
          duration: const Duration(milliseconds: 250),
          child: Material(
            color: Colors.transparent,
            child: Padding(
              padding: widget.bottomBarStyle.padding,
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
                            child: widget.bottomBarStyle.galleryIcon,
                            color: widget.bottomBarStyle.galleryIconColor,
                            size: widget.bottomBarStyle.galleryIconSize,
                            backgroundOpacity: 1,
                            padding: const EdgeInsets.all(10),
                            withShadow: true,
                            onTap: _pickFile,
                          ),
                          const SizedBox(width: 10),
                          widget.bottomBarStyle.galleryIconLabel ??
                              const Text('gallery'),
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
                            child: widget.bottomBarStyle.mediaPickerIcon,
                            color: widget.bottomBarStyle.mediaPickerIconColor,
                            size: widget.bottomBarStyle.mediaPickerIconSize,
                            backgroundOpacity: 1,
                            padding: const EdgeInsets.all(10),
                            onTap: _openMediaPickerPage,
                            withShadow: true,
                          ),
                          const SizedBox(width: 10),
                          widget.bottomBarStyle.mediaPickerIconLabel ??
                              const Text('select media'),
                        ],
                      ),
                    ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: widget.bottomBarStyle.chatBarColor,
                              borderRadius: widget.bottomBarStyle.borderRadius,
                              boxShadow: [widget.bottomBarStyle.boxShadow]),
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
                                              (context, animatorState, child) {
                                            return Opacity(
                                              opacity: animatorState.value,
                                              child: widget.bottomBarStyle
                                                  .audioMessageIcon,
                                            );
                                          }),
                                      Expanded(
                                        child: Container(height: 38),
                                      ),
                                      Text(
                                        '$_recordingMinutes:$_recordingSeconds',
                                        style: widget.bottomBarStyle
                                            .audioRecordingLabelStyle
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
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 16, top: 2, bottom: 2),
                                        child: TextField(
                                          maxLines: 5,
                                          minLines: 1,
                                          textInputAction: TextInputAction.send,
                                          textCapitalization:
                                              TextCapitalization.sentences,
                                          controller: _textController,
                                          style: widget
                                              .bottomBarStyle.textFieldStyle,
                                          cursorColor:
                                              widget.bottomBarStyle.cursorColor,
                                          onSubmitted: (value) {
                                            _sendTextMessage(value);
                                          },
                                          decoration: widget.bottomBarStyle
                                              .textFieldDecoration,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      icon:
                                          widget.bottomBarStyle.attachmentIcon,
                                      onPressed: isWebOrMacOS
                                          ? _toggleShowAttachOptions
                                          : _pickFile,
                                    ),
                                    if (!isWebOrMacOS)
                                      IconButton(
                                        icon: widget.bottomBarStyle.cameraIcon,
                                        onPressed: _takePhotoFromCamera,
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      _showSentButton
                          ? ChatCircleButton(
                              shadow: widget.bottomBarStyle.boxShadow,
                              color: widget.bottomBarStyle.iconsColor,
                              child: widget.bottomBarStyle.sendIcon,
                              size: widget.bottomBarStyle.sendIconSize,
                              onTap: () {
                                if (_showSentButton) {
                                  _sendTextMessage(_textController.text);
                                }
                              },
                            )
                          : AudioRecordButton(
                              timer: _recordTimer,
                              onRecordStartOverride: () {
                                _recordTimer?.onExecute
                                    .add(StopWatchExecute.reset);
                                _recordTimer?.onExecute
                                    .add(StopWatchExecute.start);
                                setState(() {
                                  _isRecordingAudio = true;
                                  _showAttachOptions = false;
                                });
                              },
                              onRecordEndOverride: (filePath) {
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
                              onTimerChange: _onTimerChange,
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
