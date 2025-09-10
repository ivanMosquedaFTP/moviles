import 'package:flutter/material.dart';
import 'package:pmsn20252/screens/home_screen.dart';
import 'package:pmsn20252/screens/login_screen.dart';
import 'package:pmsn20252/screens/register_screen.dart';
import 'package:pmsn20252/ui_challenge_3.dart';
import 'package:pmsn20252/utils/theme_app.dart';
import 'package:pmsn20252/utils/value_listener.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ValueListener.isDark,
      builder: (context, value, _) {
        return MaterialApp(
          theme: value ? ThemeApp.tokyonight() : ThemeApp.tokyonightLight(),
          routes: {
            "/home": (context) => HomeScreen(),
            "/uiChallenge": (context) => UiChallenge3(),
            "/register": (context) => RegisterScreen(),
            "/login": (context) => LoginScreen(),
          },
          title: 'Material App',
          // home: LoginScreen(),
          home: RegisterScreen(),
        );
      },
    );
  }
}
