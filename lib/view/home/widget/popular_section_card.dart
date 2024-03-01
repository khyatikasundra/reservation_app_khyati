import 'package:flutter/material.dart';
import 'package:reservation_app/model/rest_model.dart';

class PopularSectionCard extends StatelessWidget {
  final RestModel popularItem;
  const PopularSectionCard({required this.popularItem, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Card(
          child: ListTile(
        visualDensity: const VisualDensity(vertical: 4),
        leading: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.network(popularItem.imageURL)),
        title: Padding(
          padding: const EdgeInsets.all(10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
              "Rating ${popularItem.rating}",
              style: Theme.of(context).textTheme.displaySmall,
            )
          ]),
        ),
      )),
    );
  }
}
