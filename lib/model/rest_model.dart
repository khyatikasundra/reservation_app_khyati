import 'package:reservation_app/model/about_model.dart';
import 'package:reservation_app/model/carousel_image_model.dart';
import 'package:reservation_app/model/menu_model.dart';
import 'package:reservation_app/model/review_model.dart';
import 'package:reservation_app/strings/ui_string.dart';

class RestModel {
  final int id;
  final String hotelName;
  final String location;
  final String imageURL;
  final String hotelAddress;
  final String description;
  final int rating;
  final AboutModel about;
  final MenuModel menu;
  final List<ReviewModel> review;
  final List<CarouselImageModel> images;
  RestModel(
      {required this.id,
      required this.hotelName,
      required this.location,
      required this.description,
      required this.imageURL,
      required this.hotelAddress,
      required this.rating,
      required this.about,
      required this.menu,
      required this.review,
      required this.images});
}

List<RestModel> hotelList = [
  RestModel(
      id: 1,
      hotelName: UiString.stringAsset.kFLavorJunction,
      location: UiString.stringAsset.kJakartaIndonesia,
      imageURL:
          "https://i.pinimg.com/564x/7a/a1/94/7aa19415266b8ad0ad570b7d2ecc3e8e.jpg",
      description: UiString.stringAsset.kloremIpsum,
      rating: 5,
      about: AboutModel(description: UiString.stringAsset.kloremIpsum),
      menu: MenuModel(food: foodList, drink: drinkList),
      review: reviewList,
      images: images,
      hotelAddress: UiString.stringAsset.kFLavorJunctionAddress),
  RestModel(
      id: 2,
      hotelName: UiString.stringAsset.kRootenineCafe,
      location: UiString.stringAsset.kBundungIndonesia,
      imageURL:
          "https://i.pinimg.com/564x/dc/87/a8/dc87a8f8ebb246fcc5a7e811e7629de9.jpg",
      description: UiString.stringAsset.kloremIpsum,
      rating: 5,
      about: AboutModel(description: UiString.stringAsset.kloremIpsum),
      menu: MenuModel(food: foodList, drink: drinkList),
      review: reviewList,
      images: images,
      hotelAddress: UiString.stringAsset.kRootenineCafeAddress),
  RestModel(
      id: 3,
      hotelName: UiString.stringAsset.kMitsuiHotel,
      location: UiString.stringAsset.kGujaratIndia,
      imageURL:
          "https://i.pinimg.com/564x/2a/11/2f/2a112f695462f797da807fa7a03b6f39.jpg",
      description: UiString.stringAsset.kloremIpsum,
      rating: 4,
      about: AboutModel(description: UiString.stringAsset.kloremIpsum),
      menu: MenuModel(food: foodList, drink: drinkList),
      review: reviewList,
      images: images,
      hotelAddress: UiString.stringAsset.kMitsuiHotelAddress),
  RestModel(
      id: 4,
      hotelName: UiString.stringAsset.kGoldenResort,
      location: UiString.stringAsset.kSunnyBeachBulgaria,
      imageURL:
          "https://i.pinimg.com/564x/88/5d/75/885d75b9b0096ecff1ae66e0b59f97bb.jpg",
      description: UiString.stringAsset.kloremIpsum,
      rating: 3,
      about: AboutModel(description: UiString.stringAsset.kloremIpsum),
      menu: MenuModel(food: foodList, drink: drinkList),
      review: reviewList,
      images: images,
      hotelAddress: UiString.stringAsset.kGoldenResortAddress),
  RestModel(
      id: 5,
      hotelName: UiString.stringAsset.kMysticHotel,
      location: UiString.stringAsset.kMauiHawaii,
      imageURL:
          "https://i.pinimg.com/564x/52/eb/bb/52ebbb41ad6bd5bee8f889e2fbd6ef19.jpg",
      description: UiString.stringAsset.kloremIpsum,
      rating: 5,
      about: AboutModel(description: UiString.stringAsset.kloremIpsum),
      menu: MenuModel(food: foodList, drink: drinkList),
      review: reviewList,
      images: images,
      hotelAddress: UiString.stringAsset.kMysticHotelAddress),
];
