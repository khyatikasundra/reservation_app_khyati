import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reservation_app/model/reservation_app_model.dart';
import 'package:reservation_app/model/rest_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  List<RestModel> _recommendedHotelList = [];
  HomeCubit() : super(HomeInitial());

  void getHomeInitialData() {
    _recommendedHotelList = reservationAppData.hotel
        .where((element) => element.rating >= 4)
        .toList();
    emit(
        OnGetHomeInitialDataSuccessful(recommendedList: _recommendedHotelList));
  }

  void selectedHotelData({required int hotelId}) {
    emit(OnGetRecommendedItemSelected(selectedHotelId: hotelId));
  }
}
