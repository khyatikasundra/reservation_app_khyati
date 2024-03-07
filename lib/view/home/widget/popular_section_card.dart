import 'package:flutter/material.dart';
import 'package:reservation_app/model/rest_model.dart';
import 'package:reservation_app/strings/point_size.dart';
import 'package:reservation_app/strings/ui_string.dart';

class PopularSectionCard extends StatelessWidget {
  final RestModel popularItem;
  final VoidCallback? onPress;
  const PopularSectionCard(
      {required this.popularItem, this.onPress, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(PointSize.value6),
      child: GestureDetector(
        onTap: onPress,
        child: Card(
            child: ListTile(
          visualDensity: const VisualDensity(vertical: 4),
          leading: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(popularItem.imageURL)),
          title: _popularCartTitle(context),
        )),
      ),
    );
  }

  Widget _popularCartTitle(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(PointSize.value10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          popularItem.hotelName,
          style: Theme.of(context).textTheme.displayLarge,
        ),
        Text(
          popularItem.description,
          overflow: TextOverflow.ellipsis,
          maxLines: 3,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        Text(
          UiString.stringAsset.kRating + popularItem.rating.toString(),
          style: Theme.of(context).textTheme.displaySmall,
        )
      ]),
    );
  }
}
