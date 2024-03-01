import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/view/landing/bloc/landing_bloc.dart';
import 'package:reservation_app/view/landing/screen/landing_screen.dart';

class LandingPage extends StatelessWidget {
  static const String tag = "LandingPage";
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LandingBloc>(
      create: (context) => LandingBloc(),
      child: const LandingScreen(),
    );
  }
}
