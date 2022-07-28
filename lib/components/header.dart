import 'package:flutter/material.dart';

import '../constants/view_constants.dart';

class Header extends StatelessWidget {
  final String text;
  final Color textColor;
  final bool bottomPadding;

  const Header({
    Key? key,
    required this.text,
    required this.textColor,
    this.bottomPadding = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: ViewConstants.mediumPadding,
        bottom: bottomPadding ? ViewConstants.mediumPadding : 0,
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(
          left: ViewConstants.mediumPadding,
          right: ViewConstants.mediumPadding,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: ViewConstants.fontSize,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
