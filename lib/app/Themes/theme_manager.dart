import 'package:flutter/material.dart';

abstract class ThemeManager {
  AppBarTheme get appBarTheme;

  TextStyle get headingText;

  TextStyle get titleText;

  ElevatedButtonThemeData get elevatedButtonThemeData;

  TextStyle get buttonTextStyle;

  TextStyle get captionTextStyle;

  TextStyle get bodyTextStyle;

  TextStyle get numberTextStyle;

  TextStyle get pinCodeTextFieldStyle;

  TextButtonThemeData get textButtonThemeData;

  InputDecorationTheme get inputDecorationTheme;

  //OutlinedButtonThemeData get  outlinedButtonThemeData;

  BottomSheetThemeData get bottomSheetThemeData;
}
