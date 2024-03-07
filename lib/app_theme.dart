import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData getTheme() {
    return ThemeData(
        textTheme: const TextTheme(
            labelLarge: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            labelMedium: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
            labelSmall: TextStyle(
                fontSize: 15, color: Colors.white, fontWeight: FontWeight.w500),
            displaySmall: TextStyle(fontSize: 10),
            displayMedium: TextStyle(fontSize: 12),
            displayLarge: TextStyle(fontSize: 18)));
  }
}
