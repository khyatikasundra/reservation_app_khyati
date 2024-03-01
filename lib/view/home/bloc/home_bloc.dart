import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reservation_app/model/rest_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  List<RestModel> _recommendedHotelList = [];
  HomeBloc() : super(HomeInitial()) {
    on<GetHomeInitialData>(_getHomeInitialData);
    on<GetRecommendedCardSelected>(_selectedHotelData);
  }

  FutureOr<void> _getHomeInitialData(
      GetHomeInitialData event, Emitter<HomeState> emit) {
    _recommendedHotelList =
        hotelList.where((element) => element.rating >= 4).toList();
    emit(
        OnGetHomeInitialDataSuccessful(recommendedList: _recommendedHotelList));
  }

  FutureOr<void> _selectedHotelData(
      GetRecommendedCardSelected event, Emitter<HomeState> emit) {
    emit(OnGetRecommendedItemSelected(selectedHotelId: event.hotelId));
  }
}
