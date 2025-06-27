import 'package:flutter/material.dart';
import 'package:agri_guard/resources/app_color.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: bgColor,
    appBarTheme: const AppBarTheme(
      // color: primaryColor,
      backgroundColor: primaryColor,
    ),
    colorScheme: const ColorScheme.light(
      primary: primaryColor,
      onPrimary: Colors.white,
      secondary: Colors.blue,
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      surface: Colors.white,
      onSurface: Colors.black,
    ),
  );
}
