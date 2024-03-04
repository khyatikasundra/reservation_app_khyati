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
