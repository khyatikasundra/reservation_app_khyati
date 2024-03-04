import 'package:flutter/material.dart';
import 'package:reservation_app/model/review_model.dart';

class ReviewTab extends StatelessWidget {
  final List<ReviewModel> reviews;
  const ReviewTab({required this.reviews, super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList.builder(
            itemCount: reviews.length,
            itemBuilder: (context, index) => ListTile(
                  title: Text(reviews[index].name),
                  subtitle: Text(reviews[index].review),
                ))
      ],
    );
  }
}
