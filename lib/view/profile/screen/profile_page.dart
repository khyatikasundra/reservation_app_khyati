import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/view/profile/bloc/profile_bloc.dart';
import 'package:reservation_app/view/profile/screen/profile_screen.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileBloc>(
      create: (context) => ProfileBloc(),
      child: const ProfileScreen(),
    );
  }
}
