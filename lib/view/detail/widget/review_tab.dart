import 'package:flutter/material.dart';
import 'package:reservation_app/model/review_model.dart';
import 'package:reservation_app/view/detail/bloc/detail_bloc.dart';

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
        ? const Center(child: CircularProgressIndicator())
        : CustomScrollView(
            slivers: [
              SliverList.builder(
                  itemCount: widget.reviews.length,
                  itemBuilder: (context, index) => ListTile(
                        title: Text(widget.reviews[index].name),
                        subtitle: Text(widget.reviews[index].review),
                      ))
            ],
          );
  }

  @override
  bool get wantKeepAlive => true;
}
