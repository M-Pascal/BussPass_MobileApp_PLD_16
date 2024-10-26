import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF1565C0); // Dark blue
  static const Color accentColor = Color(0xFF64B5F6); // Light blue
  static const Color backgroundColor = Color(0xFFF5F5F5); // Light grey

  static final ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: accentColor),
    scaffoldBackgroundColor: backgroundColor,
    appBarTheme: const AppBarTheme(
      color: primaryColor,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      // Updated text theme properties
      displayLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),  // formerly headline1
      displayMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black), // formerly headline2
      bodyLarge: TextStyle(fontSize: 16, color: Colors.black87),  // formerly bodyText1
      bodyMedium: TextStyle(fontSize: 14, color: Colors.black54), // formerly bodyText2
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: primaryColor,
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: primaryColor),
      ),
    ),
  );
}