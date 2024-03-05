import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  String _profileImageUrl = "";
  ProfileCubit() : super(ProfileInitial());
  void getProfilePageInitialData() async {
    emit(ProfileLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    _profileImageUrl =
        "https://i.pinimg.com/736x/e9/45/90/e94590f7e6cad3418a5aa2a753c467c4.jpg";
    emit(OnGetProfilePageInitialData(profileImageUrl: _profileImageUrl));
  }
}
