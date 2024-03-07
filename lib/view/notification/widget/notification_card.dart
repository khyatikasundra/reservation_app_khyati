import 'package:flutter/material.dart';
import 'package:reservation_app/model/notification_model.dart';
import 'package:reservation_app/strings/point_size.dart';

class NotificationCard extends StatelessWidget {
  final NotificationModel notificationItem;
  const NotificationCard({required this.notificationItem, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(PointSize.value8),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(PointSize.value12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.notifications),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _notificationCategoryTitle(),
                  _notificationTitle(context),
                  _notificationDescription(context)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _notificationDescription(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Text(
        notificationItem.description,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      ),
    );
  }

  Widget _notificationTitle(BuildContext context) {
    return Text(
      notificationItem.title,
      style: Theme.of(context).textTheme.displayLarge,
    );
  }

  Widget _notificationCategoryTitle() {
    return Row(
      children: [
        Text(notificationItem.category.name.toUpperCase()),
        const Text("")
      ],
    );
  }
}
