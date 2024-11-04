import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const XandOApp());
}

class XandOApp extends StatelessWidget {
  const XandOApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system, // Auto switch based on system settings
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
