import 'package:flutter/material.dart';
import 'package:reservation_app/model/notification_model.dart';

class PromoCard extends StatelessWidget {
  final NotificationModel promoItem;
  const PromoCard({required this.promoItem, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Text(promoItem.title),
    );
  }
}
