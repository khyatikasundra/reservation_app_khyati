import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/view/profile/cubit/profile_cubit.dart';
import 'package:reservation_app/view/profile/screen/profile_screen.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileCubit>(
      create: (context) => ProfileCubit(),
      child: const ProfileScreen(),
    );
  }
}
