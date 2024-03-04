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
import 'package:reservation_app/view/detail/widget/about_tab.dart';
import 'package:reservation_app/view/detail/widget/menu_tab.dart';
import 'package:reservation_app/view/detail/widget/review_tab.dart';

class DetailScreen extends StatefulWidget {
  final int hotelId;
  const DetailScreen({required this.hotelId, super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late DetailBloc _detailBloc;
  int _count = 0;
  String _selectedFoodId = "";
  final String _orderButtonText = UiString.stringAsset.kReservation;
  List<FoodMenuModel> _foodList = [];
  List<FoodMenuModel> _beverageList = [];

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
      hotelAddress: UiString.stringAsset.kFLavorJunctionAddress,
      hotelReservationPrice: 160);

  @override
  void initState() {
    _detailBloc = context.read<DetailBloc>();
    _detailBloc.add(GetDetailPageInitialData(hotelId: widget.hotelId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DetailBloc, DetailState>(
      listener: (context, state) {
        if (state is OnGetDetailPageInitialData) {
          _hotelDetail = state.hotelDetail;
          _beverageList = state.hotelDetail.menu.drink;
          _foodList = state.hotelDetail.menu.food;
        }
        if (state is OnGetAddRemoveItemState) {
          _foodList = state.updatedFoodCount;
          _beverageList = state.updatedBeverageCount;
        }
      },
      builder: (context, state) {
        return Scaffold(
          bottomSheet: _bottomSheet(context),
          appBar: AppBar(
            title: Text(UiString.stringAsset.kDetailPlace),
          ),
          body: SafeArea(
              child: DefaultTabController(
            length: 3,
            child: NestedScrollView(
              headerSliverBuilder: (context, isScrolled) => [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _carouselSlider(),
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
                ),
                SliverPersistentHeader(
                    floating: false,
                    pinned: true,
                    delegate: TabDelegate(
                        tabBar: const TabBar(tabs: [
                      Tab(
                        icon: Text("About"),
                      ),
                      Tab(
                        icon: Text("Menu"),
                      ),
                      Tab(
                        icon: Text("Review"),
                      )
                    ])))
              ],
              body: TabBarView(children: [
                AboutTab(
                  aboutHotelDescription: _hotelDetail.about.description,
                ),
                MenuTab(
                  detailBloc: _detailBloc,
                  count: _count,
                  foodIdSelected: _selectedFoodId,
                  foodList: _foodList,
                  beverageList: _beverageList,
                ),
                ReviewTab(reviews: _hotelDetail.review),
              ]),
            ),
          )),
        );
      },
    );
  }

  ColoredBox _bottomSheet(BuildContext context) {
    return ColoredBox(
      color: Colors.amber,
      child: SizedBox(
        height: 80,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(UiString.stringAsset.kIDR +
                  _hotelDetail.hotelReservationPrice.toStringAsFixed(3)),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)))),
                  onPressed: () {},
                  child: Text(
                    _orderButtonText,
                    style: Theme.of(context).textTheme.labelSmall,
                  ))
            ],
          ),
        ),
      ),
    );
  }

  CarouselSlider _carouselSlider() {
    return CarouselSlider(
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
        ));
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

class TabDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;
  TabDelegate({required this.tabBar});
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
