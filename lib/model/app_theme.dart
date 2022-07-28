import 'package:flutter/material.dart';

class AppTheme {
  MaterialColor materialColor;

  Color get primaryColor => materialColor.shade300;
  Color get accentColor1 => materialColor.shade50;
  Color get accentColor2 => materialColor.shade100;
  Color get highlightColor => materialColor.shade700;

  AppTheme(this.materialColor);
}
