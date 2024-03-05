part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class OnGetHomeInitialDataSuccessful extends HomeState {
  final List<RestModel> recommendedList;
  final List<RestModel> popularList;
  const OnGetHomeInitialDataSuccessful(
      {required this.recommendedList, required this.popularList});
  @override
  List<Object> get props => [recommendedList, popularList];
}

class OnGetRecommendedItemSelected extends HomeState {
  final int selectedHotelId;
  const OnGetRecommendedItemSelected({required this.selectedHotelId});
  @override
  List<Object> get props => [selectedHotelId, identityHashCode(this)];
}
