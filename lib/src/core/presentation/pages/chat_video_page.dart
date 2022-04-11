//TODO: fix this. currently does not work bc of better_player dependency resolving...

import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:another_xlider/another_xlider.dart';
import 'package:better_player/better_player.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neon_chat/neon_chat.dart';

class ChatVideoPage extends StatefulWidget {
  static const videoHeroTag = 'chatVideoPageHero';

  final ConversationMessage message;
  final Widget? progressIndicator;
  final BoxDecoration? sliderDecoration;
  final BoxDecoration? trackbarDecoration;
  final Color? sliderColor;
  final TextStyle? labelStyle;
  final Color? backgroundColor;

  const ChatVideoPage({
    Key? key,
    required this.message,
    this.progressIndicator,
    this.sliderDecoration,
    this.trackbarDecoration,
    this.sliderColor,
    this.labelStyle,
    this.backgroundColor,
  }) : super(key: key);

  @override
  _ChatVideoPageState createState() => _ChatVideoPageState();
}

class _ChatVideoPageState extends State<ChatVideoPage> {
  BetterPlayerController? _controller;
  final playerConifg = const BetterPlayerConfiguration(
    autoPlay: true,
    looping: true,
    aspectRatio: 1 / 3,
    overlay: SizedBox.shrink(),
    controlsConfiguration: BetterPlayerControlsConfiguration(
      showControls: false,
    ),
  );

  bool isReady = false;

  void _initPlayer() async {
    if (widget.message.doneUpload) {
      print('INIT VIDEO PLAYER');
      print('UPLOAD: ${widget.message.upload}');
      final _url = await context
          .read<UploadUrlCubit>()
          .getUploadURL(widget.message.upload!.fileId);
      print('URL: $_url');

      // final _url = await getIt<GetUploadRedirectUrlForUrlUC>()
      //     .call('$kRemoteUploadsUrl/${widget.message.upload!.fileId}');
      if (_url == null) return;
      _controller = BetterPlayerController(
        playerConifg,
        betterPlayerDataSource: BetterPlayerDataSource(
          BetterPlayerDataSourceType.network,
          _url,
          placeholder: Center(
            child:
                widget.progressIndicator ?? const CircularProgressIndicator(),
          ),
        ),
      );
      _controller?.videoPlayerController?.addListener(_videoListener);

      setState(() => isReady = true);
    } else {
      _controller = BetterPlayerController(
        playerConifg,
        betterPlayerDataSource: BetterPlayerDataSource(
          BetterPlayerDataSourceType.file,
          widget.message.filePath!,
        ),
      );
      _controller?.videoPlayerController?.addListener(_videoListener);

      setState(() => isReady = true);
    }
  }

  @override
  void initState() {
    _initPlayer();
    super.initState();
  }

  void _videoListener() async {
    if (_controller?.videoPlayerController?.value.position ==
        _controller?.videoPlayerController?.value.duration) {
      // await _videoPlayerController.seekTo(Duration.zero);
      // await _videoPlayerController.pause();
    }
    setState(() {});
  }

  @override
  void dispose() {
    _controller?.videoPlayerController?.removeListener(_videoListener);
    _controller?.dispose();
    super.dispose();
  }

  void _onSliderChanged(double milliseconds) async {
    final isCurrentlyPlaying = _controller?.isPlaying() ?? false;
    _controller?.seekTo(Duration(milliseconds: milliseconds.round()));
    if (!isCurrentlyPlaying) {
      _controller?.play();
      _controller?.pause();
    }
    setState(() {});
  }

  String _getRemainingDurationText() {
    if (_controller == null || !(_controller!.isVideoInitialized() ?? false)) {
      return '';
    }
    if (_controller!.videoPlayerController?.value.duration == null) return '';
    final durationInMilliseconds =
        _controller!.videoPlayerController!.value.duration!.inMilliseconds;
    final currentPositionInMilliseconds =
        _controller!.videoPlayerController!.value.position.inMilliseconds;
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
        if (_controller != null &&
            isReady &&
            _controller != null &&
            _controller!.videoPlayerController != null &&
            (_controller!.isVideoInitialized() ?? false))
          Container(
            color: widget.backgroundColor ?? Colors.amberAccent,
            // height: 50,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(
              children: [
                Text(
                  _getDurationText(
                      _controller!.videoPlayerController!.value.position),
                  style: widget.labelStyle,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: FlutterSlider(
                    min: 0,
                    max: _controller!
                        .videoPlayerController!.value.duration?.inMilliseconds
                        .toDouble(),
                    trackBar: FlutterSliderTrackBar(
                      inactiveTrackBarHeight: 2,
                      activeTrackBarHeight: 2,
                      inactiveTrackBar: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: Colors.white.withOpacity(0.12),
                      ),
                      activeTrackBar: widget.trackbarDecoration ??
                          BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: Colors.redAccent,
                          ),
                    ),
                    handler: FlutterSliderHandler(
                      foregroundDecoration: widget.sliderDecoration ??
                          BoxDecoration(
                            border: Border.all(
                              color: Colors.redAccent,
                            ),
                            borderRadius: BorderRadius.circular(7),
                            color: Colors.black,
                          ),
                      child: Container(
                        height: 14,
                        width: 14,
                        color: widget.sliderColor ?? Colors.blueAccent,
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
                          _controller!.videoPlayerController!.value.position
                              .inMilliseconds
                              .toDouble())
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
        if (_controller != null && isReady)
          Expanded(
            child: BetterPlayer(
              controller: _controller!,
            ),
          )
      ],
    );
  }
}
