part of 'profile_cubit.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

class OnGetProfilePageInitialData extends ProfileState {
  final String profileImageUrl;
  const OnGetProfilePageInitialData({required this.profileImageUrl});
  @override
  List<Object> get props => [profileImageUrl];
}
