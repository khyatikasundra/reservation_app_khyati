part of 'detail_bloc.dart';

sealed class DetailState extends Equatable {
  const DetailState();

  @override
  List<Object> get props => [];
}

final class DetailInitial extends DetailState {}

class DetailLoadingState extends DetailState {}

class MenuLoadingState extends DetailState {}

class AboutLoadingState extends DetailState {}

class ReviewLoadingState extends DetailState {}

class OnGetDetailPageInitialData extends DetailState {
  final RestModel hotelDetail;
  final int totalPrice;
  const OnGetDetailPageInitialData(
      {required this.hotelDetail, required this.totalPrice});
}

class OnGetMenuTabInitialData extends DetailState {
  final List<FoodMenuModel> foodList;
  final List<FoodMenuModel> beverageList;
  const OnGetMenuTabInitialData(
      {required this.foodList, required this.beverageList});
}

class OnGetAboutTabInitialData extends DetailState {
  final AboutModel aboutHotel;
  const OnGetAboutTabInitialData({required this.aboutHotel});
}

class OnGetMenuTabItemState extends DetailState {
  final List<FoodMenuModel> updatedFoodCount;
  final List<FoodMenuModel> updatedBeverageCount;
  final bool isAnyMenuItemSelected;
  final int totalPrice;

  const OnGetMenuTabItemState(
      {required this.updatedFoodCount,
      required this.updatedBeverageCount,
      required this.isAnyMenuItemSelected,
      required this.totalPrice});
  @override
  List<Object> get props => [
        updatedBeverageCount,
        updatedFoodCount,
        isAnyMenuItemSelected,
        totalPrice,
        identityHashCode(this)
      ];
}
