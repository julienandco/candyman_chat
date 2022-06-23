import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neon_chat/neon_chat.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ChatFileBubble extends StatefulWidget {
  final ConversationMessage message;
  final FileBubbleStyle defaultFileBubbleStyle;

  const ChatFileBubble({
    Key? key,
    required this.message,
    required this.defaultFileBubbleStyle,
  }) : super(key: key);

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
        final url = await context
                .read<UploadUrlCubit>()
                .getUploadURL(widget.message.upload!.fileId) ??
            '';

        _didClick = false;
        _isLoading = false;
        setState(() {});

        launchUrlString(url);
      },
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
                      ? widget.defaultFileBubbleStyle.downloadIcon
                      : widget.defaultFileBubbleStyle.progressIndicator)
                  : null,
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                widget.message.text ??
                    widget.defaultFileBubbleStyle.fileTypeNotSupportedLabel,
                style: widget.defaultFileBubbleStyle.labelStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
