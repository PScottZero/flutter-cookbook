import 'package:cookbook/constants/view_constants.dart';
import 'package:flutter/material.dart';

import '../constants/functions.dart';

class RoundedButton extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final MaterialColor color;
  final Function() onPressed;
  final int colorCode;
  final bool isLarge;
  final bool disabled;

  const RoundedButton({
    Key? key,
    this.text,
    this.icon,
    required this.color,
    required this.onPressed,
    this.colorCode = 300,
    this.isLarge = true,
    this.disabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var child = Container(
      padding: isLarge
          ? const EdgeInsets.only(
              left: ViewConstants.smallPadding,
              right: ViewConstants.smallPadding,
              bottom: ViewConstants.smallPadding,
            )
          : const EdgeInsets.only(
              left: ViewConstants.smallPadding / 3,
              right: ViewConstants.smallPadding / 3,
            ),
      constraints: isLarge
          ? BoxConstraints(maxWidth: MediaQuery.of(context).size.width)
          : null,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: msp(color[colorCode]),
          padding: msp(
            EdgeInsets.all(
              isLarge ? ViewConstants.largePadding : 2,
            ),
          ),
          shape: msp(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                isLarge
                    ? ViewConstants.largeBorderRadius
                    : ViewConstants.smallBorderRadius,
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
                    fontSize: ViewConstants.smallFont,
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
    return isLarge ? child : Expanded(child: child);
  }
}
