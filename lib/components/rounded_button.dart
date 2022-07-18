import 'package:cookbook/constants/view_constants.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final MaterialColor color;
  final Function() onPressed;
  final int colorCode;

  const RoundedButton({
    Key? key,
    required this.text,
    required this.color,
    required this.onPressed,
    this.colorCode = 300,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: ViewConstants.smallPadding,
        right: ViewConstants.smallPadding,
        top: ViewConstants.smallPadding / 2,
        bottom: ViewConstants.smallPadding / 2,
      ),
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color[colorCode]),
          padding: MaterialStateProperty.all(
            const EdgeInsets.all(ViewConstants.largePadding),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                ViewConstants.largeBorderRadius,
              ),
            ),
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: color[50],
              fontSize: ViewConstants.smallFont,
            ),
          ),
        ),
      ),
    );
  }
}
