import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reservation_app/model/reservation_app_model.dart';
import 'package:reservation_app/model/rest_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  List<RestModel> _recommendedHotelList = [];
  List<RestModel> _populatHoteList = [];
  HomeCubit() : super(HomeInitial());

  Future<void> getHomeInitialData() async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 1));
    _recommendedHotelList = reservationAppData.hotel
        .where((element) => element.rating >= 4)
        .toList();
    _populatHoteList = reservationAppData.hotel;

    emit(OnGetHomeInitialDataSuccessful(
        recommendedList: _recommendedHotelList, popularList: _populatHoteList));
  }

  void selectedHotelData({required int hotelId}) {
    emit(OnGetRecommendedItemSelected(selectedHotelId: hotelId));
  }
}
