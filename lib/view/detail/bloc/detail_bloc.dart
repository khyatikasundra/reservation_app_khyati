import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reservation_app/model/menu_model.dart';
import 'package:reservation_app/model/rest_model.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  List<FoodMenuModel> _foodList = [];
  List<FoodMenuModel> _drinkList = [];
  bool _isAnyMenuItemSelected = false;
  int _totalPrice = 0;
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
    _totalPrice = _hotel.hotelReservationPrice;
    emit(OnGetDetailPageInitialData(
        hotelDetail: _hotel, totalPrice: _totalPrice));
  }

  FutureOr<void> _addRemoveItem(
      ItemAddRemoveEvent event, Emitter<DetailState> emit) {
    _countIncrementDecrement(event);
    _anyItemSelected();
    emit(OnGetAddRemoveItemState(
        updatedFoodCount: _foodList,
        updatedBeverageCount: _drinkList,
        isAnyMenuItemSelected: _isAnyMenuItemSelected,
        totalPrice: _totalPrice));
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
    _anyItemSelected();
    emit(OnGetAddRemoveItemState(
        updatedFoodCount: _foodList,
        updatedBeverageCount: _drinkList,
        isAnyMenuItemSelected: _isAnyMenuItemSelected,
        totalPrice: _totalPrice));
  }

  void _anyItemSelected() {
    var menuList = [..._foodList, ...drinkList];
    _isAnyMenuItemSelected = menuList.any((item) => item.count > 0);
    for (int i = 0; i < menuList.length; i++) {
      if (menuList[i].count > 0) {
        _totalPrice += (menuList[i].count * menuList[i].menuPrice);
      }
    }
  }
}
