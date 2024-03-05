import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/view/profile/cubit/profile_cubit.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ProfileCubit _profileCubit;
  String _profileImageUrl = "";
  @override
  void initState() {
    _profileCubit = context.read<ProfileCubit>();
    _profileCubit.getProfilePageInitialData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProfileCubit, ProfileState>(builder: (context, state) {
        if (state is OnGetProfilePageInitialData) {
          _profileImageUrl = state.profileImageUrl;
        }
        return SafeArea(
            top: false,
            child: SizedBox(
              height: 290,
              width: MediaQuery.of(context).size.width,
              child: ColoredBox(
                color: Colors.red,
                child: Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          foregroundImage: NetworkImage(_profileImageUrl),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text("Enzo Fernanez"),
                        const Text(
                          "Enzo@gmail.com",
                          style: TextStyle(fontSize: 10),
                        ),
                      ]),
                ),
              ),
            ));
      }),
    );
  }
}
