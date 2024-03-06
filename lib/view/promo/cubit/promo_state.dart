part of 'promo_cubit.dart';

sealed class PromoState extends Equatable {
  const PromoState();

  @override
  List<Object> get props => [];
}

final class PromoInitial extends PromoState {}

class PromoLoadingState extends PromoState {}

class HottestListLoadingState extends PromoState {}

class OnGetPromoPageInitialData extends PromoState {
  final List<NotificationModel> promoList;
  const OnGetPromoPageInitialData({required this.promoList});
  @override
  List<Object> get props => [promoList];
}
