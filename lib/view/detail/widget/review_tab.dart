import 'package:flutter/material.dart';
import 'package:reservation_app/model/review_model.dart';
import 'package:reservation_app/view/detail/bloc/detail_bloc.dart';
import 'package:reservation_app/view/detail/widget/review_card.dart';
import 'package:reservation_app/widget/material_loader.dart';

class ReviewTab extends StatefulWidget {
  final List<ReviewModel> reviews;
  final DetailState detailState;
  final DetailBloc detailBloc;
  const ReviewTab(
      {required this.reviews,
      required this.detailBloc,
      required this.detailState,
      super.key});

  @override
  State<ReviewTab> createState() => _ReviewTabState();
}

class _ReviewTabState extends State<ReviewTab>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    widget.detailBloc.add(GetReviewTabInitialData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.detailState is ReviewLoadingState
        ? const MaterialLoader()
        : CustomScrollView(
            slivers: [
              SliverList.builder(
                  itemCount: widget.reviews.length,
                  itemBuilder: (context, index) =>
                      ReviewCard(reviewItem: widget.reviews[index]))
            ],
          );
  }

  @override
  bool get wantKeepAlive => true;
}
