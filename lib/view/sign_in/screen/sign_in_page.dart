import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/view/sign_in/bloc/sign_in_bloc.dart';
import 'package:reservation_app/view/sign_in/screen/sign_in_screen.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignInBloc>(
      create: (context) => SignInBloc(),
      child: const SignInScreen(),
    );
  }
}
