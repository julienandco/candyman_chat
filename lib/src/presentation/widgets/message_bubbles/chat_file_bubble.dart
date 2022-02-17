import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:neon_chat/src/conversation/conversation.dart';

class ChatFileBubble extends StatefulWidget {
  const ChatFileBubble({
    Key? key,
    required this.message,
    required this.getUploadURL,
    this.downloadIcon,
    this.progressIndicator,
    //TODO
    this.fileTypeNotSupportedLabel = 'Not supported',
    this.labelStyle,
  }) : super(key: key);

  final ChatMessage message;
  final String Function(String) getUploadURL;
  final Widget? downloadIcon;
  final Widget? progressIndicator;
  final String fileTypeNotSupportedLabel;
  final TextStyle? labelStyle;

  @override
  _ChatFileBubbleState createState() => _ChatFileBubbleState();
}

class _ChatFileBubbleState extends State<ChatFileBubble>
    with SingleTickerProviderStateMixin {
  bool _didClick = false;
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (!widget.message.doneUpload || _didClick) return;
        _didClick = true;
        _isLoading = true;
        setState(() {});
        final url = widget.getUploadURL(widget.message.upload!.fileId);
        // final url = await getIt<GetUploadRedirectUrlForUrlUC>()
        //     .call('$kRemoteUploadsUrl/${widget.message.upload!.fileId}');
        _didClick = false;
        _isLoading = false;
        setState(() {});

        launch(url);
      },
      child: Container(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedSize(
              duration: const Duration(milliseconds: 200),
              child: SizedBox(
                width: 20,
                height: 20,
                child: widget.message.doneUpload
                    ? (!_isLoading
                        ? widget.downloadIcon ??
                            const Icon(
                              Icons.download,
                              color: Colors.red,
                            )
                        : widget.progressIndicator ??
                            const CircularProgressIndicator())
                    : null,
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  widget.message.text ?? widget.fileTypeNotSupportedLabel,
                  style: widget.labelStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
