import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:neon_chat/src/chat_init.dart';

class AvatarWidget extends StatelessWidget {
  final double size;
  final String? imgUrl;

  const AvatarWidget({
    Key? key,
    this.size = 50,
    this.imgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final child = Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            width: size,
            height: size,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: ClipOval(
              child: _getImage(context),
            ),
          ),
        ),
      ],
    );

    return child;
  }

  Widget _getImage(BuildContext context) {
    final placeholder = Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(size * 0.2),
      color: Colors.white,
    );

    if (imgUrl == null) return placeholder;

    if (imgUrl != null) {
      return CachedNetworkImage(
        imageUrl: imgUrl!,
        color: Colors.grey,
        httpHeaders: chatGetIt.get(instanceName: kHttpHeadersInstanceName),
      );
    }
    {
      return placeholder;
    }
  }
}
