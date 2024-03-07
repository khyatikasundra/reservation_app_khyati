import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/model/custom_list.dart';
import 'package:reservation_app/strings/ui_string.dart';
import 'package:reservation_app/view/profile/cubit/profile_cubit.dart';
import 'package:reservation_app/widget/material_loader.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ProfileCubit _profileCubit;
  String profileImageUrl = "";

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
        _profileBuildersListener(state);
        return state is ProfileLoadingState
            ? const MaterialLoader()
            : SafeArea(
                top: false,
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: _topProfileWidget(context),
                    ),
                    _settingListBuilder()
                  ],
                ));
      }),
    );
  }
  //!Functions

  void _profileBuildersListener(ProfileState state) {
    if (state is OnGetProfilePageInitialData) {
      profileImageUrl = state.profileImageUrl;
    }
  }
  //!Widget Method

  Widget _topProfileWidget(BuildContext context) {
    return SizedBox(
      height: 290,
      width: MediaQuery.of(context).size.width,
      child: ColoredBox(
        color: Colors.red,
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            _circleAvatarImage(),
            _spacer(),
            Text(UiString.stringAsset.kEnzoFernanez),
            Text(
              UiString.stringAsset.kGmailCom,
              style: const TextStyle(fontSize: 10),
            ),
          ]),
        ),
      ),
    );
  }

  Widget _spacer() {
    return const SizedBox(
      height: 15,
    );
  }

  Widget _circleAvatarImage() {
    return CircleAvatar(
      radius: 50,
      foregroundImage: NetworkImage(profileImageUrl),
      child: Text(UiString.stringAsset.kKK),
    );
  }

  Widget _settingListBuilder() {
    return SliverList.builder(
        itemCount: CustomList.profileItemList.length,
        itemBuilder: (context, index) => ListTile(
                title: Text(
              CustomList.profileItemList[index],
            )));
  }
}
