part of 'notification_cubit.dart';

sealed class NotificationState extends Equatable {
  const NotificationState();

  @override
  List<Object> get props => [];
}

final class NotificationInitial extends NotificationState {}

class NotificationLoadingState extends NotificationState {}

class OnGetNotificationFilteredDataLoadingState extends NotificationState {}

class OnGetNotificationPageInitialData extends NotificationState {
  final List<NotificationModel> notificationList;
  final List<NotificationCategory> notificationTypeList;
  const OnGetNotificationPageInitialData(
      {required this.notificationList, required this.notificationTypeList});
}

class OnGetFilteredNotification extends NotificationState {
  final List<NotificationModel> notificationList;
  const OnGetFilteredNotification({required this.notificationList});
  @override
  List<Object> get props => [notificationList, identityHashCode(this)];
}

class OnGetSelectedItemState extends NotificationState {
  final int selectedIndex;
  const OnGetSelectedItemState({required this.selectedIndex});
  @override
  List<Object> get props => [selectedIndex, identityHashCode(this)];
}
