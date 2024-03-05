import 'package:reservation_app/model/notification_model.dart';
import 'package:reservation_app/model/rest_model.dart';

class ReservationModel {
  final List<RestModel> hotel;
  final List<NotificationModel> notification;
  ReservationModel({required this.hotel, required this.notification});
}

ReservationModel reservationAppData =
    ReservationModel(hotel: hotelList, notification: notificationList);
