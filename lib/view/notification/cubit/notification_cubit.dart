import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reservation_app/model/custom_list.dart';
import 'package:reservation_app/model/notification_model.dart';
import 'package:reservation_app/model/reservation_app_model.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  List<NotificationModel> _notificationList = [];
  List<NotificationCategory> _notificationTypeList = [];
  int _selectedItem = 0;
  NotificationCubit() : super(NotificationInitial());
  
  void notificationScreenInitialData() async {
    emit(NotificationLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    _notificationList = reservationAppData.notification;
    _notificationTypeList = CustomList.notificationType;
    emit(OnGetNotificationPageInitialData(
        notificationList: _notificationList,
        notificationTypeList: _notificationTypeList));
  }

  void getFilteredNotification(int index) async {
    _selectedItem = index;
    emit(OnGetSelectedItemState(selectedIndex: _selectedItem));
    emit(OnGetNotificationFilteredDataLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    _filtering(index);
    emit(OnGetFilteredNotification(notificationList: _notificationList));
  }


  List<NotificationModel> _filtering(int index) {
    if (index == 0) {
      return _notificationList = reservationAppData.notification;
    }
    _notificationList = reservationAppData.notification.where((element) {
      return element.category == _notificationTypeList[index].category;
    }).toList();
    return _notificationList;
  }
}
