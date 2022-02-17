import 'package:flutter/material.dart';

class ChatCircleButton extends StatelessWidget {
  final Widget child;
  final double size;
  final Color color;
  final Function()? onTap;
  final EdgeInsets? padding;

  const ChatCircleButton({
    Key? key,
    required this.child,
    required this.size,
    this.color = Colors.red,
    this.onTap,
    this.padding = const EdgeInsets.all(10),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(size / 2),
        ),
        height: size,
        width: size,
        child: child,
      ),
    );
  }
}
