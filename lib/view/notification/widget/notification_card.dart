import 'package:flutter/material.dart';
import 'package:reservation_app/model/notification_model.dart';

class NotificationCard extends StatelessWidget {
  final NotificationModel notificationItem;
  const NotificationCard({required this.notificationItem, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.notifications),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(notificationItem.category.name.toUpperCase()),
                      const Text("")
                    ],
                  ),
                  Text(
                    notificationItem.title,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Text(
                      notificationItem.description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
