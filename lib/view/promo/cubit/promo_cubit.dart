import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reservation_app/model/notification_model.dart';
import 'package:reservation_app/model/reservation_app_model.dart';

part 'promo_state.dart';

class PromoCubit extends Cubit<PromoState> {
  PromoCubit() : super(PromoInitial());
  List<NotificationModel> _promoList = [];
  void getPromoPageInitialData() async {
    emit(PromoLoadingState());
    await Future.delayed(const Duration(seconds: 1));
    _promoList = reservationAppData.notification
        .where((element) => element.category == NotificationType.promo)
        .toList();
    emit(OnGetPromoPageInitialData(promoList: _promoList));
  }

  void getHottestList() async {
    emit(HottestListLoadingState());
    await Future.delayed(const Duration(seconds: 2));
  }
}
