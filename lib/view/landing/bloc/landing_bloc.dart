import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'landing_event.dart';
part 'landing_state.dart';

class LandingBloc extends Bloc<LandingEvent, LandingState> {
  int selectedTab = 0;
  LandingBloc() : super(LandingInitial()) {
    on<TabChangeEvent>(_tabChange);
  }

  FutureOr<void> _tabChange(TabChangeEvent event, Emitter<LandingState> emit) {
    
    selectedTab = event.index;
    emit(OnTabChangeState(index: selectedTab));
  }
}
