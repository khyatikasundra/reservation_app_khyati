part of 'promo_cubit.dart';

sealed class PromoState extends Equatable {
  const PromoState();

  @override
  List<Object> get props => [];
}

final class PromoInitial extends PromoState {}

class PromoLoadingState extends PromoState {}

class OnGetHottestPromoData extends PromoState {
  final List<NotificationModel> hottestList;
  const OnGetHottestPromoData({required this.hottestList});
  @override
  List<Object> get props => [hottestList];
}

class OnGetRecommendationPromoData extends PromoState {
  final List<NotificationModel> recommendationList;
  const OnGetRecommendationPromoData({required this.recommendationList});
  @override
  List<Object> get props => [recommendationList];
}
