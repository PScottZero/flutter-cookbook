import 'package:flutter/material.dart';

import '../constants/functions.dart';
import '../constants/view_constants.dart';

class RoundedButton extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final MaterialColor color;
  final Function() onPressed;
  final bool padding;

  const RoundedButton({
    Key? key,
    this.text,
    this.icon,
    required this.color,
    required this.onPressed,
    this.padding = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding
          ? const EdgeInsets.only(
              left: ViewConstants.smallPadding,
              right: ViewConstants.smallPadding,
              bottom: ViewConstants.smallPadding,
            )
          : null,
      constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: msp(color[300]),
          padding: padding
              ? msp(
                  const EdgeInsets.all(
                    ViewConstants.largePadding,
                  ),
                )
              : null,
          shape: msp(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                ViewConstants.largeBorderRadius,
              ),
            ),
          ),
        ),
        child: Center(
          child: text != null
              ? Text(
                  text!,
                  style: TextStyle(
                    color: color[50],
                    fontSize: ViewConstants.fontSize,
                  ),
                )
              : Icon(
                  icon,
                  size: 24,
                  color: color[50],
                ),
        ),
      ),
    );
  }
}
