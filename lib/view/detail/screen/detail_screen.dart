import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/model/about_model.dart';
import 'package:reservation_app/model/carousel_image_model.dart';
import 'package:reservation_app/model/menu_model.dart';
import 'package:reservation_app/model/rest_model.dart';
import 'package:reservation_app/model/review_model.dart';
import 'package:reservation_app/strings/ui_string.dart';
import 'package:reservation_app/view/detail/bloc/detail_bloc.dart';

class DetailScreen extends StatefulWidget {
  final int hotelId;
  const DetailScreen({required this.hotelId, super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late DetailBloc _detailBloc;
  RestModel _hotelDetail = RestModel(
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
      hotelAddress: UiString.stringAsset.kFLavorJunctionAddress);

  @override
  void initState() {
    _detailBloc = context.read<DetailBloc>();
    _detailBloc.add(GetDetailPageInitialData(hotelId: widget.hotelId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(UiString.stringAsset.kDetailPlace),
      ),
      body: BlocConsumer<DetailBloc, DetailState>(
        listener: (context, state) {
          if (state is OnGetDetailPageInitialData) {
            _hotelDetail = state.hotelDetail;
          }
        },
        builder: (context, state) => SafeArea(
            child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CarouselSlider(
                      items: _carouselItemList(),
                      options: CarouselOptions(
                        height: 300,
                        aspectRatio: 2,
                        viewportFraction: 0.8,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        enlargeCenterPage: false,
                        enlargeFactor: 0.3,
                        scrollDirection: Axis.horizontal,
                      )),
                  Padding(
                      padding: const EdgeInsets.only(top: 20, left: 15),
                      child: Text(
                        _hotelDetail.hotelName,
                        style: Theme.of(context).textTheme.labelLarge,
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      _hotelDetail.hotelAddress,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }

  List<ClipRRect> _carouselItemList() {
    return _hotelDetail.images
        .map((element) => ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.network(
                element.imageUrl,
                height: 200,
                width: 260,
                fit: BoxFit.cover,
              ),
            ))
        .toList();
  }
}
