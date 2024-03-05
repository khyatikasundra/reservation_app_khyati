import 'package:flutter/material.dart';
import 'package:reservation_app/model/custom_list.dart';
import 'package:reservation_app/view/notification/cubit/notification_cubit.dart';

class SortItemCard extends StatelessWidget {
  final NotificationCategory notificationTypeItem;
  final NotificationCubit notificationCubit;
  final int index;
  const SortItemCard(
      {required this.notificationTypeItem,
      required this.notificationCubit,
      required this.index,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => notificationCubit.getFilteredNotification(index),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3),
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: const BorderSide(color: Colors.black)),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(notificationTypeItem.typeName),
            ),
          ),
        ),
      ),
    );
  }
}
