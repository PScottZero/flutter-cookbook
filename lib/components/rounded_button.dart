import 'package:cookbook/constants/view_constants.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final MaterialColor color;
  final Function() onPressed;

  const RoundedButton({
    Key? key,
    required this.text,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        padding: const EdgeInsets.all(ViewConstants.smallPadding),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(
            ViewConstants.smallBorderRadius,
          ),
        ),
        child: Text(text),
      ),
    );
  }
}
