import 'package:reservation_app/strings/ui_string.dart';

enum NotificationType { all, info, transaction, promo }

enum PromoType { hottest, recommendation }

class NotificationModel {
  final String title;
  final String description;
  final NotificationType category;
  final PromoType? promoType;
  final DateTime date;

  NotificationModel(
      {required this.title,
      required this.description,
      required this.category,
      required this.date,
      this.promoType});
}

List<NotificationModel> notificationList = [
  NotificationModel(
      title: UiString.stringAsset.kTopUpIDR200,
      description: UiString.stringAsset.kloremIpsum,
      category: NotificationType.transaction,
      date: DateTime(2024, 3, 5)),
  NotificationModel(
      title: UiString.stringAsset.kFreeDelivery,
      description: UiString.stringAsset.kloremIpsum,
      category: NotificationType.transaction,
      date: DateTime(2024, 3, 5)),
  NotificationModel(
      title: UiString.stringAsset.k40PerDiscount,
      description: UiString.stringAsset.kloremIpsum,
      category: NotificationType.promo,
      date: DateTime(2024, 3, 5),
      promoType: PromoType.hottest),
  NotificationModel(
      title: UiString.stringAsset.kTopUpIDR200,
      description: UiString.stringAsset.kloremIpsum,
      category: NotificationType.info,
      date: DateTime(2024, 3, 4)),
  NotificationModel(
      title: UiString.stringAsset.kFree1cedTea,
      description: UiString.stringAsset.kloremIpsum,
      category: NotificationType.promo,
      date: DateTime(2024, 3, 5),
      promoType: PromoType.hottest),
  NotificationModel(
      title: UiString.stringAsset.k25perDiscount,
      description: UiString.stringAsset.kloremIpsum,
      category: NotificationType.promo,
      date: DateTime(2024, 3, 4),
      promoType: PromoType.recommendation),
  NotificationModel(
      title: UiString.stringAsset.kBuy2Get1,
      description: UiString.stringAsset.kloremIpsum,
      category: NotificationType.promo,
      date: DateTime(2024, 3, 4),
      promoType: PromoType.recommendation)
];
