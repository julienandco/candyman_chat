import 'package:flutter/material.dart';

class ChatCircleButton extends StatelessWidget {
  final Widget child;
  final double size;
  final Color color;
  final Function()? onTap;
  final EdgeInsets? padding;
  final BoxShadow shadow;

  const ChatCircleButton({
    Key? key,
    required this.child,
    required this.size,
    this.color = Colors.red,
    this.onTap,
    this.padding = const EdgeInsets.all(10),
    this.shadow = const BoxShadow(
      color: Colors.transparent,
      spreadRadius: 2,
      blurRadius: 5,
      offset: Offset(2, 4),
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(size / 2),
            boxShadow: [shadow]),
        height: size,
        width: size,
        child: child,
      ),
    );
  }
}
