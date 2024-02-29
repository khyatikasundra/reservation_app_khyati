import 'package:flutter/material.dart';
import 'package:reservation_app/view/sign_in/screen/sign_in_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SignInPage(),
    );
  }
}
