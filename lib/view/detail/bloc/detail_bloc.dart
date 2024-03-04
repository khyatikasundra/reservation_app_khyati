import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reservation_app/model/menu_model.dart';
import 'package:reservation_app/model/rest_model.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  List<FoodMenuModel> _foodList = [];
  List<BeverageMenuModel> _drinkList = [];

  late RestModel _hotel;
  DetailBloc() : super(DetailInitial()) {
    on<GetDetailPageInitialData>(_getInitialDetailPageData);
    on<ItemAddRemoveEvent>(_addRemoveItem);
    on<GetAddQuantityEvent>(_addQuantity);
  }

  FutureOr<void> _getInitialDetailPageData(
      GetDetailPageInitialData event, Emitter<DetailState> emit) {
    _hotel = hotelList.firstWhere((element) => element.id == event.hotelId);
    _foodList = _hotel.menu.food;
    _drinkList = _hotel.menu.drink;
    emit(OnGetDetailPageInitialData(hotelDetail: _hotel));
  }

  FutureOr<void> _addRemoveItem(
      ItemAddRemoveEvent event, Emitter<DetailState> emit) {
    _countIncrementDecrement(event);
    emit(OnGetAddRemoveItemState(
      updatedFoodCount: _foodList,
      updatedBeverageCount: _drinkList,
    ));
  }

  void _countIncrementDecrement(ItemAddRemoveEvent event) {
    switch (event.menuId[0]) {
      case 'F':
        event.addOrRemove
            ? _foodList[event.index].count += 1
            : _foodList[event.index].count = (_foodList[event.index].count > 0)
                ? _foodList[event.index].count - 1
                : 0;
        break;
      case 'B':
        event.addOrRemove
            ? _drinkList[event.index].count += 1
            : _drinkList[event.index].count =
                (_drinkList[event.index].count > 0)
                    ? _drinkList[event.index].count - 1
                    : 0;
        break;
    }
  }

  FutureOr<void> _addQuantity(
      GetAddQuantityEvent event, Emitter<DetailState> emit) {
    switch (event.menuId[0]) {
      case 'F':
        _foodList[event.index].count += 1;

        break;
      case 'B':
        _drinkList[event.index].count += 1;

        break;
    }
    emit(OnGetAddRemoveItemState(updatedFoodCount: _foodList, updatedBeverageCount: _drinkList));
  }
}
