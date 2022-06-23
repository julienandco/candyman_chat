import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neon_chat/src/conversation/conversation.dart';

import 'package:record/record.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class AudioRecordButton extends StatefulWidget {
  final StopWatchTimer? timer;
  final Function()? onRecordStart;
  final Function(String?)? onRecordEnd;
  final void Function(int)? onTimerChange;
  final Color recordingOngoingColor;
  final Color recordingInactiveColor;
  final Color recordingInactiveBorderColor;
  final Color borderColor;
  final Color haloColor;
  final Widget iconActiv;
  final Widget iconInActiv;
  final double buttonRadius;

  /// Either set this and [recordingInactiveChild] to be non-null or do not set
  /// them at all and use the other parameters to customize the appearance
  /// of the [AudioRecordButton].
  final Widget? recordingActiveChild;

  /// Either set this and [recordingActiveChild] to be non-null or do not set
  /// them at all and use the other parameters to customize the appearance
  /// of the [AudioRecordButton].
  final Widget? recordingInactiveChild;

  const AudioRecordButton({
    Key? key,
    this.timer,
    this.onRecordStart,
    this.onRecordEnd,
    this.onTimerChange,
    this.recordingInactiveColor = Colors.white,
    this.recordingInactiveBorderColor = Colors.transparent,
    this.recordingOngoingColor = Colors.redAccent,
    this.borderColor = Colors.white30,
    this.haloColor = Colors.white30,
    this.iconActiv = const Icon(Icons.mic_none_outlined),
    this.iconInActiv = const Icon(Icons.mic),
    this.buttonRadius = 23,
    this.recordingActiveChild,
    this.recordingInactiveChild,
  })  : assert((recordingActiveChild != null &&
                recordingInactiveChild != null) ||
            (recordingActiveChild == null && recordingInactiveChild == null)),
        super(key: key);

  @override
  _AudioRecordButtonState createState() => _AudioRecordButtonState();
}

class _AudioRecordButtonState extends State<AudioRecordButton>
    with SingleTickerProviderStateMixin {
  bool _isRecording = false;
  Animation<double>? _animation;
  AnimationController? _animationController;
  final _audioRecorder = Record();

  int _recordingSec = 0;
  StopWatchTimer? _recordTimer;

  void _onTimerChange(int secs) {
    setState(() {
      _recordingSec = secs;
    });
    widget.onTimerChange?.call(secs);
  }

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 250));
    _animation =
        Tween<double>(begin: 0, end: -25).animate(_animationController!)
          ..addListener(() {
            setState(() {});
          });

    _recordTimer = widget.timer ??
        StopWatchTimer(
          mode: StopWatchMode.countUp,
          onChangeRawSecond: _onTimerChange,
        );

    super.initState();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    _audioRecorder.dispose();
    _recordTimer?.dispose();
    super.dispose();
  }

  void _defaultOnRecordStart() {
    _recordTimer?.onExecute.add(StopWatchExecute.reset);
    _recordTimer?.onExecute.add(StopWatchExecute.start);
    setState(() {
      _isRecording = true;
    });
  }

  void _defaultOnRecordEnd(String? filePath) {
    if (_recordingSec > 0) {
      context.read<ConversationBloc>().add(ConversationEvent.sendVoiceMessage(
            filePath!,
            Duration(seconds: _recordingSec),
          ));
    }

    _recordTimer?.onExecute.add(StopWatchExecute.stop);
    _recordTimer?.onExecute.add(StopWatchExecute.reset);
    setState(() {
      _isRecording = false;
    });
  }

  Future<void> _start() async {
    try {
      if (await _audioRecorder.hasPermission()) {
        await _audioRecorder.start();

        bool isRecording = await _audioRecorder.isRecording();
        setState(() {
          _isRecording = isRecording;
        });

        (widget.onRecordStart ?? _defaultOnRecordStart).call();
        _animationController!.forward();
      }
    } catch (e) {
      log('$e', name: '$runtimeType');
      rethrow;
    }
  }

  Future<void> _stop() async {
    final url = await _audioRecorder.stop();
    setState(() => _isRecording = false);

    (widget.onRecordEnd ?? _defaultOnRecordEnd).call(url);
    _animationController!.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final recordIndicatorOffset = _animation!.value;

    final hasCustomChildren = widget.recordingActiveChild != null &&
        widget.recordingInactiveChild != null;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: recordIndicatorOffset,
          bottom: recordIndicatorOffset,
          left: recordIndicatorOffset,
          right: recordIndicatorOffset,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            height: _isRecording ? 60 : 0,
            width: _isRecording ? 60 : 0,
            decoration: BoxDecoration(
              color: widget.haloColor,
              shape: BoxShape.circle,
            ),
          ),
        ),
        Listener(
          onPointerDown: (_) => _start(),
          onPointerUp: (_) => _stop(),
          child: hasCustomChildren
              ? _isRecording
                  ? widget.recordingActiveChild
                  : widget.recordingInactiveChild
              : Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: _isRecording
                        ? widget.recordingOngoingColor
                        : widget.recordingInactiveColor,
                    borderRadius: BorderRadius.circular(widget.buttonRadius),
                    border: Border.all(
                      width: 2,
                      color: _isRecording
                          ? widget.recordingOngoingColor
                          : widget.recordingInactiveBorderColor,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(2, 4),
                      )
                    ],
                  ),
                  height: 46,
                  width: 46,
                  child: _isRecording ? widget.iconInActiv : widget.iconActiv,
                ),
        ),
      ],
    );
  }
}
