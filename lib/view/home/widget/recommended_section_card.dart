import 'package:flutter/material.dart';
import 'package:reservation_app/model/rest_model.dart';
import 'package:reservation_app/strings/point_size.dart';

class RecommendedSectionCard extends StatelessWidget {
  final RestModel recommendedItem;
  final VoidCallback? onPress;
  const RecommendedSectionCard(
      {required this.recommendedItem, this.onPress, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Stack(children: [_backgroundHotelImage(), _hotelTitle(context)]),
      ),
    );
  }

  Widget _hotelTitle(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          recommendedItem.hotelName,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Text(
          recommendedItem.location,
          style: Theme.of(context).textTheme.labelSmall,
        )
      ],
    );
  }

  Widget _backgroundHotelImage() {
    return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          recommendedItem.imageURL,
          width: PointSize.hotelImageWidth,
          fit: BoxFit.fill,
        ));
  }
}
