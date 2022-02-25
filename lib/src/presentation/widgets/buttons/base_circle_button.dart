import 'package:flutter/material.dart';

class BaseCircleButton extends StatelessWidget {
  final double size;
  final bool dynamicWidth;
  final Function()? onTap;
  final Widget? child;
  final double backgroundOpacity;
  final Color color;
  final EdgeInsets? padding;
  final bool withShadow;

  const BaseCircleButton({
    Key? key,
    this.size = 30,
    this.dynamicWidth = false,
    this.backgroundOpacity = 0.6,
    this.onTap,
    this.child,
    this.color = const Color(0xff2E2342),
    this.padding,
    this.withShadow = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: SizedBox(
        width: dynamicWidth ? null : size,
        height: size,
        child: Container(
          decoration: BoxDecoration(
            color: color.withOpacity(backgroundOpacity),
            borderRadius: BorderRadius.circular(size),
            boxShadow: withShadow
                ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ]
                : [],
          ),
          child: Padding(
            padding: padding ?? const EdgeInsets.all(8.0),
            child: child,
          ),
        ),
      ),
    );
  }
}
