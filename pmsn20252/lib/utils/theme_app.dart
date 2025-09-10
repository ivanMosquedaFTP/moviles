import 'package:flutter/material.dart';

class ThemeApp {
  static ThemeData darkTheme() {
    final theme = ThemeData.dark().copyWith(
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: Colors.grey,
        onPrimary: Colors.amber,
        secondary: Colors.amber,
        onSecondary: Colors.red,
        error: Colors.red,
        onError: Colors.red,
        surface: Colors.orange,
        onSurface: Colors.green,
      ),
    );
    return theme;
  }

  static lightTheme() {
    final lightTheme = ThemeData.light().copyWith(
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: Colors.white,
        onPrimary: Colors.purple,
        secondary: Colors.grey,
        onSecondary: Colors.redAccent,
        error: Colors.red,
        onError: Colors.red,
        surface: Colors.blueAccent,
        onSurface: Colors.green,
      ),
    );
    return lightTheme;
  }

  static ThemeData tokyonight() {
    final base = ThemeData.dark();
    return base.copyWith(
      colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: Color(0xFF7AA2F7),
        onPrimary: Colors.white,
        secondary: Color(0xFF9ECE6A),
        onSecondary: Colors.white,
        error: Color(0xFFF7768E),
        onError: Colors.white,
        background: Color(0xFF1A1B26),
        onBackground: Color(0xFFC0CAF5),
        surface: Color(0xFF1A1B26),
        onSurface: Color(0xFFC0CAF5),
      ),
      scaffoldBackgroundColor: Color(0xFF1A1B26),
    );
  }

  static ThemeData tokyonightLight() {
    final base = ThemeData.light();
    return base.copyWith(
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xFF2959AA),
        onPrimary: Colors.white,
        secondary: Color(0xFF385F0D),
        onSecondary: Colors.white,
        error: Color(0xFF8C4351),
        onError: Colors.white,
        background: Color(0xFFE6E7ED),
        onBackground: Color(0xFF40434F),
        surface: Color(0xFFE6E7ED),
        onSurface: Color(0xFF343B58),
      ),
      scaffoldBackgroundColor: Color(0xFFE6E7ED),
      textTheme: base.textTheme.apply(
        bodyColor: Color(0xFF40434F),
        displayColor: Color(0xFF343B58),
      ),
    );
  }
}
