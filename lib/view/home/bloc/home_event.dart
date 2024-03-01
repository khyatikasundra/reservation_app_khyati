part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetHomeInitialData extends HomeEvent {}

class GetRecommendedCardSelected extends HomeEvent {
  final int hotelId;
  const GetRecommendedCardSelected({required this.hotelId});
  @override
  List<Object> get props => [hotelId];
}
