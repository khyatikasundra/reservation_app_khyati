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
