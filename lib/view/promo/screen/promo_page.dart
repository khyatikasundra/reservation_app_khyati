import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/view/promo/cubit/promo_cubit.dart';
import 'package:reservation_app/view/promo/screen/promo_screen.dart';

class PromoPage extends StatelessWidget {
  const PromoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PromoCubit>(
      create: (context) => PromoCubit(),
      child: const PromoScreen(),
    );
  }
}
