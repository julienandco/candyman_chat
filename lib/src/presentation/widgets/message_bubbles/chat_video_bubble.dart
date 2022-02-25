import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import 'package:neon_chat/neon_chat.dart';

class ChatVideoBubble extends StatefulWidget {
  final ChatMessage message;
  final void Function()? onTap;
  final Function(String) getUploadURL;
  final BoxDecoration? outerDecoration;
  final BoxDecoration? innerDecoration;
  final Widget? playIcon;

  const ChatVideoBubble({
    Key? key,
    required this.message,
    required this.getUploadURL,
    this.onTap,
    this.outerDecoration,
    this.innerDecoration,
    this.playIcon,
  }) : super(key: key);

  @override
  _ChatVideoBubbleState createState() => _ChatVideoBubbleState();
}

class _ChatVideoBubbleState extends State<ChatVideoBubble> {
  Uint8List? _thumbnailBytes;
  void _initializeThumbnail() async {
    if (widget.message.doneUpload && !isWebOrMacOS) {
      final url = widget.getUploadURL(widget.message.upload!.fileId);
      if (url != null) {
        final thumbnailBytes = await VideoThumbnail.thumbnailData(
          video: url,
          imageFormat: ImageFormat.JPEG,
          maxHeight: 200,
          timeMs: 1000,
          quality: 100,
        );
        setState(() {
          _thumbnailBytes = thumbnailBytes;
        });
      }
    } else {}
  }

  @override
  void initState() {
    _initializeThumbnail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement style
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        decoration: widget.outerDecoration ??
            BoxDecoration(
              image: _thumbnailBytes != null
                  ? DecorationImage(
                      image: MemoryImage(
                        _thumbnailBytes!,
                      ),
                      fit: BoxFit.cover)
                  : null,
              color: Colors.black,
              borderRadius: BorderRadius.circular(20),
            ),
        height: 200,
        width: MediaQuery.of(context).size.width * 0.5,
        child: Center(
          child: Container(
            height: 60,
            width: 60,
            decoration: widget.innerDecoration ??
                const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
            padding: const EdgeInsets.all(8),
            child: widget.playIcon ??
                const Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                ),
          ),
        ),
      ),
    );
  }
}
