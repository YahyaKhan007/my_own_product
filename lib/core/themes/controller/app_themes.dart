import 'package:flutter/material.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    cardTheme: const CardThemeData(color: Colors.white),
    brightness: Brightness.light,
    cardColor: Colors.white,
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: const Color(0xffF0F2F5),
    primaryColor: Colors.black,
    dividerColor: Colors.grey.shade600,
    buttonTheme: ButtonThemeData(
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: const Color(0xFF254EDB),
        // Light theme button primary color
        onPrimary: Colors.white,
        // Text color on the primary color button
        secondary: const Color(0xffDEF2FF),
        // Secondary color (you can choose another color)
        onSecondary: Colors.black,
        // Text color for secondary button
        error: Colors.red,
        // Error color
        onError: Colors.white,
        // Text color on error button
        surface: Colors.grey.shade200,
        // Background color of button surface
        onSurface: Colors.black, // Text color on surface
      ),
    ),
    iconTheme: const IconThemeData(color: Colors.black),
    expansionTileTheme: ExpansionTileThemeData(
      backgroundColor: Colors.transparent,
      collapsedBackgroundColor: Colors.transparent,
      tilePadding: EdgeInsets.zero,
      childrenPadding: EdgeInsets.zero,
      shape: Border.all(color: Colors.transparent),
      collapsedShape: Border.all(color: Colors.transparent),
    ),
    colorScheme: ColorScheme.fromSeed(
      primary: Colors.white,
      onPrimary: Colors.black,
      secondary: const Color(0xffE1E2E3),
      seedColor: Colors.white,
      error: Colors.red,
      onError: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: const Color(0xffF0F2F5),
      foregroundColor: const Color(0xffF0F2F5),
    ),
    textTheme: TextTheme(
      bodySmall: TextStyle(color: Colors.black, fontSize: 12),
      bodyMedium: TextStyle(color: Colors.black, fontSize: 14),
      bodyLarge: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.blueGrey,
    scaffoldBackgroundColor: const Color(0xff1E1E1E),
    cardColor: const Color(0xff2C2C2C),
    cardTheme: const CardThemeData(color: Color(0xff2C2C2C)),
    primaryColor: Colors.white,
    dividerColor: Colors.grey.shade500,
    buttonTheme: ButtonThemeData(
      colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: const Color(0xFF3B61DF),
        // Dark theme button primary color
        onPrimary: Colors.white,
        // Text color on the primary color button
        secondary: const Color(0xff00233A),
        // Secondary color (you can choose another color)
        onSecondary: Colors.white,
        // Text color for secondary button
        error: Colors.red,
        // Error color
        onError: Colors.white,
        // Text color on error button
        surface: Colors.grey.shade800,
        // Background color of button surface
        onSurface: Colors.white, // Text color on surface
      ),
    ),
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      // primary: Colors.white,
      primary: Colors.black,
      // Default primary color
      onPrimary: Colors.white,
      // Use grey for your switch container
      secondary: Color(0xff28292C),
      // Ensure secondary matches as needed
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      surface: Colors.grey,
      onSurface: Colors.white,
    ),
    expansionTileTheme: ExpansionTileThemeData(
      backgroundColor: Colors.transparent,
      collapsedBackgroundColor: Colors.transparent,
      tilePadding: EdgeInsets.zero,
      childrenPadding: EdgeInsets.zero,
      shape: Border.all(color: Colors.transparent),
      collapsedShape: Border.all(color: Colors.transparent),
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    appBarTheme: AppBarTheme(
      backgroundColor: const Color(0xff1E1E1E),
      foregroundColor: const Color(0xff1E1E1E),
    ),
    textTheme: TextTheme(
      bodySmall: TextStyle(color: Colors.white, fontSize: 12),
      bodyMedium: TextStyle(color: Colors.white, fontSize: 14),
      bodyLarge: TextStyle(color: Colors.white, fontSize: 16),
    ),
  );
}
