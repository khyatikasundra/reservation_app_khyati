part of 'landing_bloc.dart';

sealed class LandingEvent extends Equatable {
  const LandingEvent();

  @override
  List<Object> get props => [];
}

class TabChangeEvent extends LandingEvent {
  final int index;
  const TabChangeEvent({required this.index});
  @override
  List<Object> get props => [index];
}
