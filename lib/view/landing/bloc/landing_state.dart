part of 'landing_bloc.dart';

sealed class LandingState extends Equatable {
  const LandingState();

  @override
  List<Object> get props => [];
}

final class LandingInitial extends LandingState {}

class OnTabChangeState extends LandingState {
  final int index;
  const OnTabChangeState({required this.index});
  @override
  List<Object> get props => [index, identityHashCode(this)];
}
