import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubHeader extends StatelessWidget {
  final Widget? title;
  final Widget? action;
  final Widget? leading;

  final BoxDecoration decoration;
  final EdgeInsets padding;

  const SubHeader({
    Key? key,
    this.title,
    this.action,
    this.leading,
    this.decoration = const BoxDecoration(
      color: Colors.black,
      boxShadow: [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 10,
          spreadRadius: 5,
          offset: Offset(0, 4),
        ),
      ],
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(15),
        bottomRight: Radius.circular(15),
      ),
    ),
    this.padding = const EdgeInsets.symmetric(vertical: 15),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration,
      child: SafeArea(
        bottom: false,
        child: Container(
            padding: padding,
            child: Row(
              children: [
                leading ??
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        padding: const EdgeInsets.only(
                            left: 20.0, top: 8, bottom: 8),
                        child: const Icon(
                          CupertinoIcons.arrow_left,
                          size: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                const SizedBox(
                  width: 10,
                ),
                if (title != null) title!,
                const Expanded(
                    child: SizedBox(
                  width: 10,
                )),
                if (action != null)
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: action,
                  ),
              ],
            )),
      ),
    );
  }
}
