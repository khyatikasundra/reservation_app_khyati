import 'package:reservation_app/strings/ui_string.dart';

class ReviewModel {
  final String name;
  final String review;
  ReviewModel({required this.name, required this.review});
}

List<ReviewModel> reviewList = [
  ReviewModel(
      name: UiString.stringAsset.kRonaldRichards,
      review: UiString.stringAsset.kloremIpsum)
];
