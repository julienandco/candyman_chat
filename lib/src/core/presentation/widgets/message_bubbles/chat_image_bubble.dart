import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:neon_chat/src/chat_init.dart';

import 'package:neon_chat/src/conversation/conversation.dart';

class ChatImageBubble extends StatelessWidget {
  final ConversationMessage message;
  final double height;

  final void Function()? onTap;
  const ChatImageBubble({
    Key? key,
    required this.message,
    this.height = 200,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: height,
        width: MediaQuery.of(context).size.width * 0.5,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: message.upload == null
              ? Image.file(File(message.filePath!))
              : RedirectedCachedNetworkImage(
                  url:
                      '${chatGetIt<NeonChatRemoteDataSource>().remoteUploadsURL}/${message.upload!.fileId}',
                  placeholder: Container(),
                ),
        ),
      ),
    );
  }
}

//TODO

class RedirectedCachedNetworkImage extends StatefulWidget {
  final String url;
  final Widget placeholder;
  final BoxFit fit;
  final double? width;
  final double? height;
  final int? maxHeightDiskCache;
  final bool debugPrint;
  final bool needsRedirect;
  final Widget Function(BuildContext, String, DownloadProgress)?
      progressIndicatorBuilder;
  final Color? color;
  final bool withFadeIn;

  const RedirectedCachedNetworkImage({
    Key? key,
    required this.url,
    required this.placeholder,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
    this.progressIndicatorBuilder,
    this.maxHeightDiskCache,
    this.debugPrint = false,
    this.needsRedirect = true,
    this.color,
    this.withFadeIn = true,
  }) : super(key: key);

  @override
  _RedirectedCachedNetworkImageState createState() =>
      _RedirectedCachedNetworkImageState();
}

class _RedirectedCachedNetworkImageState
    extends State<RedirectedCachedNetworkImage> {
  String? _redirectedUrl;

  @override
  void initState() {
    _redirectedUrl = widget.url;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_redirectedUrl != null) {
      return CachedNetworkImage(
        imageUrl: _redirectedUrl!,
        fadeInDuration:
            widget.withFadeIn ? const Duration(milliseconds: 2) : Duration.zero,
        placeholderFadeInDuration:
            widget.withFadeIn ? const Duration(milliseconds: 2) : Duration.zero,
        maxHeightDiskCache: widget.maxHeightDiskCache,
        errorWidget: (context, url, error) => widget.placeholder,
        progressIndicatorBuilder:
            widget.withFadeIn ? widget.progressIndicatorBuilder : null,
        httpHeaders: chatGetIt.get(instanceName: kHttpHeadersInstanceName),
        fadeOutDuration:
            widget.withFadeIn ? const Duration(milliseconds: 2) : Duration.zero,
        fit: widget.fit,
        width: widget.width,
        height: widget.height,
        placeholder: widget.progressIndicatorBuilder != null
            ? null
            : (context, url) => widget.placeholder,
        color: widget.color,
      );
    }
    return widget.placeholder;
  }
}
