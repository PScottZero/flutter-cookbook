import 'package:flutter/material.dart';

import '../constants/functions.dart';
import '../constants/view_constants.dart';
import '../model/app_theme.dart';

class RoundedButton extends StatelessWidget {
  final AppTheme theme;
  final Function() onPressed;
  final String? text;
  final IconData? icon;
  final bool padding;

  const RoundedButton({
    Key? key,
    required this.theme,
    required this.onPressed,
    this.text,
    this.icon,
    this.padding = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding
          ? const EdgeInsets.only(
              left: ViewConstants.mediumPadding,
              right: ViewConstants.mediumPadding,
              bottom: ViewConstants.mediumPadding,
            )
          : null,
      constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: msp(theme.primaryColor),
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
                    color: theme.accentColor1,
                    fontSize: ViewConstants.fontSize,
                  ),
                )
              : Icon(
                  icon,
                  size: ViewConstants.buttonIconSize,
                  color: theme.accentColor1,
                ),
        ),
      ),
    );
  }
}
