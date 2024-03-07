import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reservation_app/app_theme.dart';
import 'package:reservation_app/view/detail/screen/detail_page.dart';
import 'package:reservation_app/view/home/screen/home_page.dart';
import 'package:reservation_app/view/home/screen/home_screen.dart';
import 'package:reservation_app/view/landing/screen/landing_screen.dart';
import 'package:reservation_app/view/sign_in/screen/sign_in_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      home: LandingScreen(),
      routes: {
        LandingScreen.tag: (context) => LandingScreen(),
      },
      theme: AppTheme.getTheme(),
    );
  }
}
