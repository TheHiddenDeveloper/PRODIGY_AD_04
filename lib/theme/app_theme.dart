import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light, // Set the brightness for the light theme
    primaryColor: Colors.green, // Green app bar color
    hintColor: Colors.green,  // Green accent color
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(
      primary: Colors.green,
      secondary: Colors.green,
      brightness: Brightness.light, // Light mode brightness
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black, backgroundColor: Colors.green,      // Black text on buttons
      ),
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark, // Set the brightness for the dark theme
    primaryColor: Colors.green, // Green app bar color in dark mode
    hintColor: Colors.green,  // Green accent color in dark mode
    scaffoldBackgroundColor: const Color(0xFF121212),
    colorScheme: const ColorScheme.dark(
      primary: Colors.green,
      secondary: Colors.green,
      brightness: Brightness.dark, // Dark mode brightness
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black, backgroundColor: Colors.green,      // Black text on buttons in dark mode
      ),
    ),
  );
}
