import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:neon_chat/src/conversation/domain/use_cases/get_upload_url_uc.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import 'package:neon_chat/neon_chat.dart';

class ChatVideoBubble extends StatefulWidget {
  final ChatMessage message;
  final void Function()? onTap;
  final GetUploadUrlUC getUploadUrlUC;

  final VideoPlayerStyle defaultVideoPlayerStyle;

  const ChatVideoBubble({
    Key? key,
    required this.message,
    required this.getUploadUrlUC,
    required this.defaultVideoPlayerStyle,
    this.onTap,
  }) : super(key: key);

  @override
  _ChatVideoBubbleState createState() => _ChatVideoBubbleState();
}

class _ChatVideoBubbleState extends State<ChatVideoBubble> {
  Uint8List? _thumbnailBytes;
  void _initializeThumbnail() async {
    if (widget.message.doneUpload && !isWebOrMacOS) {
      final url =
          await widget.getUploadUrlUC(id: widget.message.upload!.fileId);
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
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        decoration: widget.defaultVideoPlayerStyle.outerDecoration ??
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
              decoration: widget.defaultVideoPlayerStyle.innerDecoration,
              padding: const EdgeInsets.all(8),
              child: widget.defaultVideoPlayerStyle.playIcon),
        ),
      ),
    );
  }
}
