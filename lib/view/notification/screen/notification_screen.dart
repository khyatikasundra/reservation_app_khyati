import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/model/custom_list.dart';
import 'package:reservation_app/model/notification_model.dart';
import 'package:reservation_app/strings/ui_string.dart';
import 'package:reservation_app/view/notification/cubit/notification_cubit.dart';
import 'package:reservation_app/view/notification/widget/notification_card.dart';
import 'package:reservation_app/view/notification/widget/sort_item_card.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late NotificationCubit _notificationCubit;
  List<NotificationModel> _notificationList = [];
  List<NotificationCategory> _notificationTypeList = [];
  @override
  void initState() {
    _notificationCubit = context.read<NotificationCubit>();
    _notificationCubit.notificationScreenInitialData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(UiString.stringAsset.kNotification),
      ),
      body: BlocConsumer<NotificationCubit, NotificationState>(
          listener: (context, state) => {
                if (state is OnGetFilteredNotification)
                  {_notificationList = state.notificationList}
              },
          builder: (context, state) {
            if (state is OnGetNotificationPageInitialData) {
              _notificationList = state.notificationList;
              _notificationTypeList = state.notificationTypeList;
            }
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 40,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _notificationTypeList.length,
                        itemBuilder: (context, index) {
                          print(_notificationTypeList[index].typeName);
                          return SortItemCard(
                            notificationTypeItem: _notificationTypeList[index],
                            notificationCubit: _notificationCubit,
                            index: index,
                          );
                        }),
                  ),
                ),
                SliverList.builder(
                    itemCount: _notificationList.length,
                    itemBuilder: (context, index) => NotificationCard(
                          notificationItem: _notificationList[index],
                        ))
              ],
            );
          }),
    );
  }
}
