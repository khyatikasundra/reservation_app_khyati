import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/view/home/cubit/home_cubit.dart';
import 'package:reservation_app/view/home/screen/home_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider<HomeCubit>(create: (context) => HomeCubit())],
      child: const HomeScreen(),
    );
  }
}
