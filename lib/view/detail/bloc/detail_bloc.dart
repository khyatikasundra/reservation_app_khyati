import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reservation_app/model/rest_model.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc() : super(DetailInitial()) {
    on<GetDetailPageInitialData>(_getInitialDetailPageData);
  }

  FutureOr<void> _getInitialDetailPageData(
      GetDetailPageInitialData event, Emitter<DetailState> emit) {
    RestModel hotel =
        hotelList.firstWhere((element) => element.id == event.hotelId);
    emit(OnGetDetailPageInitialData(hotelDetail: hotel));
  }
}
