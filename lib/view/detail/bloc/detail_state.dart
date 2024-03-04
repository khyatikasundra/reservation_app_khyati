part of 'detail_bloc.dart';

sealed class DetailState extends Equatable {
  const DetailState();

  @override
  List<Object> get props => [];
}

final class DetailInitial extends DetailState {}

class OnGetDetailPageInitialData extends DetailState {
  final RestModel hotelDetail;
  const OnGetDetailPageInitialData({required this.hotelDetail});
}

class OnGetAddRemoveItemState extends DetailState {
  final List<FoodMenuModel> updatedFoodCount;
  final List<BeverageMenuModel> updatedBeverageCount;
  const OnGetAddRemoveItemState(
      {
      required this.updatedFoodCount,
      required this.updatedBeverageCount});
  @override
  List<Object> get props => [
        updatedBeverageCount,
        updatedFoodCount,
        identityHashCode(this)
      ];
}
