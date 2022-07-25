import 'package:flutter/material.dart';

import '../constants/view_constants.dart';

class Header extends StatelessWidget {
  final String text;
  final MaterialColor color;

  const Header({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: ViewConstants.smallPadding),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(
          ViewConstants.smallPadding,
          ViewConstants.largePadding,
          ViewConstants.smallPadding,
          ViewConstants.largePadding,
        ),
        color: color[300],
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: ViewConstants.largeFont,
            color: color[50],
          ),
        ),
      ),
    );
  }
}
