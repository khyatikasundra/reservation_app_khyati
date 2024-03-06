part of 'detail_bloc.dart';

sealed class DetailEvent extends Equatable {
  const DetailEvent();

  @override
  List<Object> get props => [];
}

class GetDetailPageInitialData extends DetailEvent {
  final int hotelId;
  const GetDetailPageInitialData({required this.hotelId});
}

class GetMenuTabInitialData extends DetailEvent {}

class GetAboutTabInitialData extends DetailEvent {}

class GetReviewTabInitialData extends DetailEvent {}

class GetAddQuantityEvent extends DetailEvent {
  final int index;
  final String menuId;
  const GetAddQuantityEvent({required this.menuId, required this.index});
}

class ItemAddRemoveEvent extends DetailEvent {
  final int index;
  final bool addOrRemove;
  final String menuId;
  const ItemAddRemoveEvent(
      {required this.addOrRemove, required this.menuId, required this.index});
}

class GetReservationStatusEvent extends DetailEvent {}

// class GetMenuTabInitialData extends DetailEvent {}
