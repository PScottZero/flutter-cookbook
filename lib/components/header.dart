import 'package:flutter/material.dart';

import '../constants/view_constants.dart';

class Header extends StatelessWidget {
  final String text;
  final MaterialColor color;
  final bool bottomPadding;

  const Header({
    Key? key,
    required this.text,
    required this.color,
    this.bottomPadding = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: ViewConstants.smallPadding,
        bottom: bottomPadding ? ViewConstants.smallPadding : 0,
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(
          ViewConstants.smallPadding,
          0,
          ViewConstants.smallPadding,
          0,
        ),
        child: Text(
          text,
          // textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: ViewConstants.fontSize,
            color: color[300],
          ),
        ),
      ),
    );
  }
}
