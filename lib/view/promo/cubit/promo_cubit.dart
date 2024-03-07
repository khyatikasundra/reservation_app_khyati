import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reservation_app/model/enums.dart';
import 'package:reservation_app/model/notification_model.dart';
import 'package:reservation_app/model/reservation_app_model.dart';

part 'promo_state.dart';

class PromoCubit extends Cubit<PromoState> {
  PromoCubit() : super(PromoInitial());

  void getPromoInitialData() {
    getRecommendationList();
    getHottestList();
  }

  void getHottestList() async {
    emit(HottestDataLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    final List<NotificationModel> promoList = reservationAppData.notification
        .where((element) => element.category == NotificationType.promo)
        .toList();
    final List<NotificationModel> hottestList = promoList
        .where((element) => element.promoType == PromoType.hottest)
        .toList();
    emit(OnGetHottestPromoData(hottestList: hottestList));
  }

  void getRecommendationList() async {
    emit(RecommendationDataLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    final List<NotificationModel> promoList = reservationAppData.notification
        .where((element) => element.category == NotificationType.promo)
        .toList();
    final List<NotificationModel> recommendationList = promoList
        .where((element) => element.promoType == PromoType.recommendation)
        .toList();
    emit(OnGetRecommendationPromoData(recommendationList: recommendationList));
  }
}
