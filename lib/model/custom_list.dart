import 'package:reservation_app/model/notification_model.dart';
import 'package:reservation_app/strings/ui_string.dart';

class CustomList {
  static List<NotificationCategory> notificationType = [
    NotificationCategory(
        typeName: UiString.stringAsset.kAll, category: NotificationType.all),
    NotificationCategory(
        typeName: UiString.stringAsset.kInfo, category: NotificationType.info),
    NotificationCategory(
        typeName: UiString.stringAsset.kPromo,
        category: NotificationType.promo),
    NotificationCategory(
        typeName: UiString.stringAsset.kTransaction,
        category: NotificationType.transaction),
  ];
}

class NotificationCategory {
  final String typeName;
  final NotificationType category;
  NotificationCategory({required this.typeName, required this.category});
}
