import 'dart:math' as math;

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:another_xlider/another_xlider.dart';
import 'package:neon_chat/src/chat_init.dart';
import 'package:video_player/video_player.dart';

import 'package:neon_chat/src/conversation/conversation.dart';

//TODO:  test
class ChatVideoPageWeb extends StatefulWidget {
  static const videoHeroTag = 'chatVideoPageHero';

  final ConversationMessage message;
  final String? Function(String) getUploadURL;
  final Widget? progressIndicator;
  final TextStyle? labelStyle;
  final BoxDecoration? trackBarDecoration;
  final BoxDecoration? sliderDecoration;
  final Color? sliderColor;
  final Color? playerColor;
  final Color? backgroundColor;

  const ChatVideoPageWeb({
    Key? key,
    required this.message,
    required this.getUploadURL,
    this.progressIndicator,
    this.labelStyle,
    this.trackBarDecoration,
    this.sliderDecoration,
    this.sliderColor,
    this.playerColor,
    this.backgroundColor,
  }) : super(key: key);

  @override
  _ChatVideoPageState createState() => _ChatVideoPageState();
}

class _ChatVideoPageState extends State<ChatVideoPageWeb> {
  VideoPlayerController? videoPlayerController;
  ChewieController? chewieController;

  bool isReady = false;

  void _initPlayer() async {
    if (widget.message.doneUpload) {
      final _url = widget.getUploadURL(widget.message.upload!.fileId);
      final headers = chatGetIt<Map<String, String>>(
          instanceName: kHttpHeadersInstanceName);

      if (_url == null) return;
      videoPlayerController =
          VideoPlayerController.network(_url, httpHeaders: headers);

      await videoPlayerController?.initialize();

      chewieController = ChewieController(
        videoPlayerController: videoPlayerController!,
        autoPlay: true,
        looping: true,
        overlay: const SizedBox.shrink(),
        showControls: false,
        showOptions: false,
        placeholder: Center(
            child:
                widget.progressIndicator ?? const CircularProgressIndicator()),
      );
      videoPlayerController?.addListener(_videoListener);

      setState(() {
        isReady = true;
      });
    }
  }

  @override
  void initState() {
    _initPlayer();
    super.initState();
  }

  void _videoListener() async {
    if (videoPlayerController?.value.position ==
        videoPlayerController?.value.duration) {}
    setState(() {});
  }

  @override
  void dispose() {
    videoPlayerController?.removeListener(_videoListener);
    videoPlayerController?.dispose();
    chewieController?.dispose();
    super.dispose();
  }

  void _onSliderChanged(double milliseconds) async {
    final isCurrentlyPlaying = chewieController?.isPlaying ?? false;
    videoPlayerController?.seekTo(Duration(milliseconds: milliseconds.round()));
    if (!isCurrentlyPlaying) {
      chewieController?.play();
      chewieController?.pause();
    }
    setState(() {});
  }

  String _getRemainingDurationText() {
    if (chewieController == null) {
      return '';
    }
    if (chewieController?.videoPlayerController.value.duration == null) {
      return '';
    }
    final durationInMilliseconds =
        chewieController!.videoPlayerController.value.duration.inMilliseconds;
    final currentPositionInMilliseconds =
        chewieController!.videoPlayerController.value.position.inMilliseconds;
    final remainingDurationInMilliseconds =
        durationInMilliseconds - currentPositionInMilliseconds;
    final remainingDuration =
        Duration(milliseconds: remainingDurationInMilliseconds);
    return _getDurationText(remainingDuration);
  }

  String _getDurationText(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String minutes = duration.inMinutes.remainder(60).toString();
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$twoDigitSeconds";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (chewieController != null && isReady)
          Container(
            color: widget.backgroundColor ?? Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(
              children: [
                Text(
                  _getDurationText(
                      chewieController!.videoPlayerController.value.position),
                  style: widget.labelStyle,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: FlutterSlider(
                    min: 0,
                    max: videoPlayerController!.value.duration.inMilliseconds
                        .toDouble(),
                    trackBar: FlutterSliderTrackBar(
                      inactiveTrackBarHeight: 2,
                      activeTrackBarHeight: 2,
                      inactiveTrackBar: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: Colors.white.withOpacity(0.12),
                      ),
                      activeTrackBar: widget.trackBarDecoration ??
                          BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: Colors.amberAccent,
                          ),
                    ),
                    handler: FlutterSliderHandler(
                      foregroundDecoration: widget.sliderDecoration ??
                          BoxDecoration(
                            border: Border.all(
                              color: Colors.amberAccent,
                            ),
                            borderRadius: BorderRadius.circular(7),
                            color: Colors.black,
                          ),
                      child: Container(
                        height: 14,
                        width: 14,
                        color: widget.sliderColor ?? Colors.black,
                      ),
                    ),
                    handlerHeight: 14,
                    handlerWidth: 14,
                    touchSize: 30,
                    tooltip: FlutterSliderTooltip(disabled: true),
                    handlerAnimation:
                        const FlutterSliderHandlerAnimation(scale: 1),
                    jump: false,
                    step: const FlutterSliderStep(step: 0.001),
                    values: [
                      math.max(
                        0,
                        chewieController!
                            .videoPlayerController.value.position.inMilliseconds
                            .toDouble(),
                      )
                    ],
                    onDragCompleted: (_, value, __) => _onSliderChanged(value),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  '-${_getRemainingDurationText()}',
                  style: widget.labelStyle,
                ),
              ],
            ),
          ),
        if (chewieController != null && isReady)
          Expanded(
            child: Container(
              color: widget.playerColor ?? Colors.black,
              child: Chewie(
                controller: chewieController!,
              ),
            ),
          )
      ],
    );
  }
}
