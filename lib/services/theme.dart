import 'package:flutter/material.dart';

class CustomTheme {
  static final ThemeData defaultTheme = _buildTheme();
  static const Colorblue = Color(0xFF293548);
  static const Colororange = Color(0xFFee7203);
  static const ColorBackButton = Colors.white;
  // static const ColorFond = Color.fromRGBO(6, 4, 9, 1);

  static ThemeData _buildTheme() {
    ThemeData build = ThemeData.light();

    return build.copyWith(
      scaffoldBackgroundColor: Colororange,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: ColorBackButton),
        backgroundColor: Colororange,
        elevation: 0,
      ),
      textTheme: TextTheme(
        bodyMedium: TextStyle(color: Colors.black),
      ),
      primaryColor: Colorblue,
      primaryColorDark: Colororange,
    );
  }
}
