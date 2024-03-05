import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/view/home/cubit/home_cubit.dart';
import 'package:reservation_app/view/home/screen/home_screen.dart';
import 'package:reservation_app/view/profile/cubit/profile_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(create: (context) => ProfileCubit())
      ],
      child: const HomeScreen(),
    );
  }
}
