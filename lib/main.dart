import 'package:flutter/material.dart';
import 'package:reservation_app/view/detail/screen/detail_page.dart';
import 'package:reservation_app/view/landing/screen/landing_page.dart';
import 'package:reservation_app/view/sign_in/screen/sign_in_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LandingPage(),
      routes: {
        LandingPage.tag: (context) => const LandingPage(),
        DetailPage.tag: (context) => const DetailPage()
      },
      theme: ThemeData(
          textTheme: const TextTheme(
              labelLarge: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              labelMedium: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              labelSmall: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
              displaySmall: TextStyle(fontSize: 10),
              displayMedium: TextStyle(fontSize: 12),
              displayLarge: TextStyle(fontSize: 18))),
    );
  }
}
