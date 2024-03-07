import 'package:flutter/material.dart';
import 'package:reservation_app/model/custom_list.dart';
import 'package:reservation_app/strings/point_size.dart';
import 'package:reservation_app/view/notification/cubit/notification_cubit.dart';

class SortItemCard extends StatelessWidget {
  final NotificationCategory notificationTypeItem;
  final NotificationCubit notificationCubit;
  final int index;
  final int selectedCategoryIndex;
  const SortItemCard(
      {required this.notificationTypeItem,
      required this.notificationCubit,
      required this.index,
      required this.selectedCategoryIndex,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        notificationCubit.getFilteredNotification(index);
      },
      child: Card(
        color: selectedCategoryIndex == index ? Colors.black : Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: const BorderSide(color: Colors.black)),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: PointSize.value25),
            child: Text(
              notificationTypeItem.typeName,
              style: TextStyle(
                  color: index == selectedCategoryIndex
                      ? Colors.white
                      : Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
