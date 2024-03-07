import 'package:flutter/material.dart';
import 'package:reservation_app/model/review_model.dart';
import 'package:reservation_app/strings/point_size.dart';

class ReviewCard extends StatelessWidget {
  final ReviewModel reviewItem;
  const ReviewCard({required this.reviewItem, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(PointSize.value6),
      child: Card(
        child: ListTile(
          title: _reviewTitle(),
          subtitle: _reviewDescription(),
        ),
      ),
    );
  }

  Widget _reviewDescription() {
    return Text(
      reviewItem.review,
      maxLines: 3,
    );
  }

  Widget _reviewTitle() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(reviewItem.name),
      Row(
        children: [
          const Icon(
            Icons.star_rounded,
            color: Colors.amber,
          ),
          Text(reviewItem.star.toString())
        ],
      )
    ]);
  }
}
