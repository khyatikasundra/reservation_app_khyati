part of 'detail_bloc.dart';

sealed class DetailState extends Equatable {
  const DetailState();

  @override
  List<Object> get props => [];
}

final class DetailInitial extends DetailState {}

class OnGetDetailPageInitialData extends DetailState {
  final RestModel hotelDetail;
  final int totalPrice;
  const OnGetDetailPageInitialData(
      {required this.hotelDetail, required this.totalPrice});
}

class OnGetAddRemoveItemState extends DetailState {
  final List<FoodMenuModel> updatedFoodCount;
  final List<FoodMenuModel> updatedBeverageCount;
  final bool isAnyMenuItemSelected;
  final int totalPrice;

  const OnGetAddRemoveItemState(
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
