import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reservation_app/model/about_model.dart';
import 'package:reservation_app/model/menu_model.dart';
import 'package:reservation_app/model/reservation_app_model.dart';
import 'package:reservation_app/model/rest_model.dart';
import 'package:reservation_app/model/review_model.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  List<FoodMenuModel> _foodList = [];
  List<FoodMenuModel> _drinkList = [];
  bool _isAnyMenuItemSelected = false;
  int _totalPrice = 0;
  AboutModel _aboutModel = AboutModel(description: "");
  late RestModel _hotel;
  DetailBloc() : super(DetailInitial()) {
    on<GetDetailPageInitialData>(_getInitialDetailPageData);
    on<ItemAddRemoveEvent>(_addRemoveItem);
    on<GetAddQuantityEvent>(_addQuantity);
    on<GetMenuTabInitialData>(_getInitialMenuTabData);
    on<GetAboutTabInitialData>(_getInitialAboutTabData);
    on<GetReviewTabInitialData>(_getInitialReviewData);

    // on<GetMenuTabInitialData>(_grtMenuTabInitialData);
  }

  FutureOr<void> _getInitialDetailPageData(
      GetDetailPageInitialData event, Emitter<DetailState> emit) async {
    emit(DetailLoadingState());
    await Future.delayed(const Duration(seconds: 3));

    _hotel = reservationAppData.hotel
        .firstWhere((element) => element.id == event.hotelId);
    _totalPrice = _hotel.hotelReservationPrice;
    emit(OnGetDetailPageInitialData(
        hotelDetail: _hotel, totalPrice: _totalPrice));
  }

  FutureOr<void> _getInitialMenuTabData(
      GetMenuTabInitialData event, Emitter<DetailState> emit) async {
    emit(MenuLoadingState());
    await Future.delayed(const Duration(seconds: 1));
    _foodList = _hotel.menu.food;
    _drinkList = _hotel.menu.drink;
    emit(
        OnGetMenuTabInitialData(foodList: _foodList, beverageList: _drinkList));
  }

  FutureOr<void> _getInitialAboutTabData(
      GetAboutTabInitialData event, Emitter<DetailState> emit) async {
    emit(AboutLoadingState());
    await Future.delayed(const Duration(seconds: 1));
    _aboutModel = _hotel.about;
    emit(OnGetAboutTabInitialData(aboutHotel: _aboutModel));
  }

  FutureOr<void> _getInitialReviewData(
      GetReviewTabInitialData event, Emitter<DetailState> emit) async {
    emit(ReviewLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    emit(OnGetReviewTabInitialData(reviewList: _hotel.review));
  }

  FutureOr<void> _addRemoveItem(
      ItemAddRemoveEvent event, Emitter<DetailState> emit) {
    _countIncrementDecrement(event);
    _anyItemSelected();
    emit(OnGetMenuTabItemState(
        updatedFoodCount: _foodList,
        updatedBeverageCount: _drinkList,
        isAnyMenuItemSelected: _isAnyMenuItemSelected,
        totalPrice: _totalPrice));
  }

  void _countIncrementDecrement(ItemAddRemoveEvent event) {
    switch (event.menuId[0]) {
      case 'F':
        List<FoodMenuModel> foodListCopy = List.from(_foodList);
        foodListCopy[event.index] = foodListCopy[event.index].copyWith(
          count: event.addOrRemove
              ? foodListCopy[event.index].count + 1
              : (foodListCopy[event.index].count > 0)
                  ? foodListCopy[event.index].count - 1
                  : 0,
        );

        _totalPrice = event.addOrRemove
            ? _totalPrice + _foodList[event.index].menuPrice
            : _totalPrice - _foodList[event.index].menuPrice;

        _foodList = List.from(foodListCopy);
        break;
      case 'B':
        List<FoodMenuModel> drinkListCopy = List.from(_drinkList);
        drinkListCopy[event.index] = drinkListCopy[event.index].copyWith(
          count: event.addOrRemove
              ? drinkListCopy[event.index].count + 1
              : (drinkListCopy[event.index].count > 0)
                  ? drinkListCopy[event.index].count - 1
                  : 0,
        );

        _totalPrice = event.addOrRemove
            ? _totalPrice + _drinkList[event.index].menuPrice
            : _totalPrice - _drinkList[event.index].menuPrice;

        _drinkList = List.from(drinkListCopy);
        break;
    }
  }

  FutureOr<void> _addQuantity(
      GetAddQuantityEvent event, Emitter<DetailState> emit) {
    switch (event.menuId[0]) {
      case 'F':
        List<FoodMenuModel> foodListCopy = List.from(_foodList);
        foodListCopy[event.index] = foodListCopy[event.index].copyWith(
          count: foodListCopy[event.index].count + 1,
        );

        _totalPrice += foodListCopy[event.index].menuPrice;

        _foodList = List.from(foodListCopy);
        break;
      case 'B':
        List<FoodMenuModel> drinkListCopy = List.from(_drinkList);
        drinkListCopy[event.index] = drinkListCopy[event.index].copyWith(
          count: drinkListCopy[event.index].count + 1,
        );

        _totalPrice += _drinkList[event.index].menuPrice;

        _drinkList = List.from(drinkListCopy);
        break;
    }
    _anyItemSelected();
    emit(OnGetMenuTabItemState(
      updatedFoodCount: _foodList,
      updatedBeverageCount: _drinkList,
      isAnyMenuItemSelected: _isAnyMenuItemSelected,
      totalPrice: _totalPrice,
    ));
  }

  void _anyItemSelected() {
    var menuList = [..._foodList, ...drinkList];
    _isAnyMenuItemSelected = menuList.any((item) => item.count > 0);
  }

  // FutureOr<void> _grtMenuTabInitialData(
  //     GetMenuTabInitialData event, Emitter<DetailState> emit)  {
  //   emit(OnGetMenuTabItemState(
  //       totalPrice: _totalPrice,
  //       updatedFoodCount: _foodList,
  //       updatedBeverageCount: _drinkList,
  //       isAnyMenuItemSelected: _isAnyMenuItemSelected));
  // }
}
