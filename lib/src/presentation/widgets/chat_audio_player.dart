// import 'dart:math';

import 'dart:developer' as dev;
import 'dart:math';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:neon_chat/neon_chat.dart';
import 'package:neon_chat/src/conversation/domain/use_cases/get_upload_url_uc.dart';
import 'package:rxdart/rxdart.dart';

class ChatAudioPlayer extends StatefulWidget {
  final ChatMessage message;

  final AudioPlayerStyle audioPlayerStyle;

  final GetUploadUrlUC getUploadUrlUC;

  const ChatAudioPlayer({
    Key? key,
    required this.message,
    required this.audioPlayerStyle,
    required this.getUploadUrlUC,
  }) : super(key: key);

  @override
  _ChatAudioPlayerState createState() => _ChatAudioPlayerState();
}

class _ChatAudioPlayerState extends State<ChatAudioPlayer> {
  final player = AudioPlayer();

  @override
  void initState() {
    initPlayer();
    super.initState();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  Stream<PlayerData> get _positionDataStream =>
      Rx.combineLatest4<Duration, Duration, Duration?, bool, PlayerData>(
        player.positionStream,
        player.bufferedPositionStream,
        player.durationStream,
        player.playingStream,
        (position, bufferedPosition, duration, isPlaying) => PlayerData(
          position,
          bufferedPosition,
          duration ?? Duration.zero,
          isPlaying,
        ),
      );

  void initPlayer() async {
    try {
      if (widget.message.isMe && !kIsWeb && !widget.message.doneUpload) {
        await player.setAudioSource(
            AudioSource.uri(Uri.parse(widget.message.filePath!)));
      } else if (widget.message.doneUpload) {
        final url = await widget.getUploadUrlUC
                .call(id: widget.message.upload!.fileId) ??
            '';
        await player.setUrl(url);
      }
    } catch (e) {
      dev.log('Error init chat audio player: $e', name: '$runtimeType');
    }

    player.playerStateStream.listen(
      (state) {
        if (state.processingState == ProcessingState.completed) {
          if (mounted) {
            player.pause();
            player.seek(const Duration()).then((e) => setState(() {}));
          }
        }
      },
    );
  }

  void onPlayPausePressed() {
    if (player.playing) {
      player.pause();
    } else {
      player.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _positionDataStream,
      initialData: PlayerData(
        Duration.zero,
        Duration.zero,
        widget.message.audioDuration!,
        false,
      ),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        final data = snapshot.data as PlayerData;
        return Row(
          children: [
            ChatCircleButton(
              child: data.isPlaying
                  ? widget.audioPlayerStyle.playingIcon
                  : widget.audioPlayerStyle.playIcon,
              size: 30,
              onTap: onPlayPausePressed,
              padding: const EdgeInsets.all(5),
            ),
            Expanded(
              child: _SearchBar(
                duration: data.duration,
                position: data.position,
                bufferedPosition: data.bufferedPosition,
                onChangeEnd: player.seek,
                labelStyle: widget.audioPlayerStyle.labelStyle,
                sliderColor: widget.audioPlayerStyle.sliderColor,
                activeTrackColor: widget.audioPlayerStyle.activeTrackColor,
                thumbColor: widget.audioPlayerStyle.thumbColor,
              ),
            ),
          ],
        );
      },
    );
  }
}

class PlayerData {
  final Duration position;
  final Duration bufferedPosition;
  final Duration duration;
  final bool isPlaying;

  PlayerData(
    this.position,
    this.bufferedPosition,
    this.duration,
    this.isPlaying,
  );
}

class _SearchBar extends StatefulWidget {
  final Duration duration;
  final Duration position;
  final Duration bufferedPosition;
  final ValueChanged<Duration>? onChanged;
  final ValueChanged<Duration>? onChangeEnd;
  final TextStyle? labelStyle;
  final Color sliderColor;
  final Color activeTrackColor;
  final Color thumbColor;

  const _SearchBar({
    required this.duration,
    required this.position,
    required this.bufferedPosition,
    this.onChanged,
    this.onChangeEnd,
    this.labelStyle,
    required this.sliderColor,
    required this.activeTrackColor,
    required this.thumbColor,
  });

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<_SearchBar> {
  double? _dragValue;
  late SliderThemeData _sliderThemeData;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _sliderThemeData = SliderTheme.of(context).copyWith(
      overlayColor: widget.sliderColor.withOpacity(0.2),
      trackHeight: 2.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SliderTheme(
          data: _sliderThemeData.copyWith(
            thumbShape: HiddenThumbComponentShape(),
            activeTrackColor: widget.activeTrackColor,
            thumbColor: Colors.red,
            inactiveTrackColor: Colors.grey.shade300,
          ),
          child: ExcludeSemantics(
            child: Slider(
              min: 0.0,
              max: widget.duration.inMilliseconds.toDouble(),
              value: min(widget.bufferedPosition.inMilliseconds.toDouble(),
                  widget.duration.inMilliseconds.toDouble()),
              onChanged: (value) {
                setState(() => _dragValue = value);
                if (widget.onChanged != null) {
                  widget.onChanged!(Duration(milliseconds: value.round()));
                }
              },
              onChangeEnd: (value) {
                if (widget.onChangeEnd != null) {
                  widget.onChangeEnd!(Duration(milliseconds: value.round()));
                }
                _dragValue = null;
              },
            ),
          ),
        ),
        SliderTheme(
          data: _sliderThemeData.copyWith(
            inactiveTrackColor: widget.activeTrackColor.withOpacity(0.4),
            activeTrackColor: widget.activeTrackColor,
            thumbColor: widget.thumbColor,
          ),
          child: Slider(
            min: 0.0,
            max: widget.duration.inMilliseconds.toDouble(),
            value: min(_dragValue ?? widget.position.inMilliseconds.toDouble(),
                widget.duration.inMilliseconds.toDouble()),
            onChanged: (value) {
              setState(() => _dragValue = value);
              if (widget.onChanged != null) {
                widget.onChanged!(Duration(milliseconds: value.round()));
              }
            },
            onChangeEnd: (value) {
              if (widget.onChangeEnd != null) {
                widget.onChangeEnd!(Duration(milliseconds: value.round()));
              }
              _dragValue = null;
            },
          ),
        ),
        Positioned(
          right: 16.0,
          bottom: 0.0,
          child: Text(
            RegExp(r'((^0*[1-9]\d*:)?\d{2}:\d{2})\.\d+$')
                    .firstMatch("$_remaining")
                    ?.group(1) ??
                '$_remaining',
            style: widget.labelStyle,
          ),
        ),
      ],
    );
  }

  Duration get _remaining => widget.duration - widget.position;
}

class HiddenThumbComponentShape extends SliderComponentShape {
  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) => Size.zero;

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {}
}
