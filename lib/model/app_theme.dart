import 'package:flutter/material.dart';

class AppTheme {
  MaterialColor materialColor;

  Color get primaryColor => materialColor[300]!;
  Color get accentColor1 => materialColor[50]!;
  Color get accentColor2 => materialColor[100]!;
  Color get highlightColor => materialColor[900]!;

  AppTheme(this.materialColor);
}
