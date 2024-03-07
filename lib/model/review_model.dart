import 'package:reservation_app/strings/ui_string.dart';

class ReviewModel {
  final String name;
  final String review;
  final int star;
  ReviewModel({required this.name, required this.review, required this.star});
}

List<ReviewModel> reviewList = [
  ReviewModel(
      name: UiString.stringAsset.kRonaldRichards,
      review: UiString.stringAsset.kloremIpsum,
      star: 4),
  ReviewModel(
      name: UiString.stringAsset.kRonaldRichards,
      review: UiString.stringAsset.kloremIpsum,
      star: 3),
  ReviewModel(
      name: UiString.stringAsset.kRonaldRichards,
      review: UiString.stringAsset.kloremIpsum,
      star: 4),
  ReviewModel(
      name: UiString.stringAsset.kRonaldRichards,
      review: UiString.stringAsset.kloremIpsum,
      star: 5),
];
