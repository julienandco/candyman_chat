import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';

import 'package:record/record.dart';

class AudioRecordButton extends StatefulWidget {
  final Function()? onRecordStart;
  final Function(String?)? onRecordEnd;
  final Color recordingOngoingColor;
  final Color recordingInactiveColor;
  final Color recordingInactiveBorderColor;
  final Color borderColor;
  final Widget iconActiv;
  final Widget iconInActiv;
  final double buttonRadius;

  const AudioRecordButton({
    Key? key,
    this.onRecordStart,
    this.onRecordEnd,
    this.recordingInactiveColor = Colors.white,
    this.recordingInactiveBorderColor = Colors.transparent,
    this.recordingOngoingColor = Colors.redAccent,
    this.borderColor = Colors.white30,
    this.iconActiv = const Icon(Icons.mic_none_outlined),
    this.iconInActiv = const Icon(Icons.mic),
    this.buttonRadius = 23,
  }) : super(key: key);

  @override
  _AudioRecordButtonState createState() => _AudioRecordButtonState();
}

class _AudioRecordButtonState extends State<AudioRecordButton>
    with SingleTickerProviderStateMixin {
  bool _isRecording = false;
  Animation<double>? _animation;
  AnimationController? _animationController;
  final _audioRecorder = Record();
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 250));
    _animation =
        Tween<double>(begin: 0, end: -25).animate(_animationController!)
          ..addListener(() {
            setState(() {});
          });

    super.initState();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    _audioRecorder.dispose();
    super.dispose();
  }

  Future<void> _start() async {
    try {
      if (await _audioRecorder.hasPermission()) {
        await _audioRecorder.start();

        bool isRecording = await _audioRecorder.isRecording();
        setState(() {
          _isRecording = isRecording;
        });

        widget.onRecordStart?.call();
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

    widget.onRecordEnd?.call(url);
    _animationController!.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final recordIndicatorOffset = _animation!.value;

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
              color: widget.borderColor,
              shape: BoxShape.circle,
            ),
          ),
        ),
        Listener(
          onPointerDown: (_) => _start(),
          onPointerUp: (_) => _stop(),
          child: Container(
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
              child: _isRecording ? widget.iconInActiv : widget.iconActiv

              // SvgPicture.asset(
              //   'assets/vectors/voiceMailIcon.svg',
              //   color: _isRecording ? kColorAccent : kColorWhite,
              // ),
              ),
        ),
      ],
    );
  }
}
