import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/model/menu_model.dart';
import 'package:reservation_app/model/reservation_app_model.dart';
import 'package:reservation_app/model/rest_model.dart';
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
  bool _isAnyMenuItemAdd = false;
  List<FoodMenuModel> _foodList = [];
  List<FoodMenuModel> _beverageList = [];
  int _totalPrice = 0;

  RestModel _hotelDetail = reservationAppData.hotel[0];

  @override
  void initState() {
    _detailBloc = context.read<DetailBloc>();
    _detailBloc.add(GetDetailPageInitialData(hotelId: widget.hotelId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DetailBloc, DetailState>(
      listener: (context, state) => _listener(state),
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
              headerSliverBuilder: (context, isScrolled) =>
                  [_topWidget(context), _tabBar()],
              body: _tabBarView(state),
            ),
          )),
        );
      },
    );
  }

  void _listener(DetailState state) {
    if (state is OnGetDetailPageInitialData) {
      _hotelDetail = state.hotelDetail;
      _foodList = _hotelDetail.menu.food;
      _beverageList = _hotelDetail.menu.drink;
      _totalPrice = state.totalPrice;
    }
    if (state is OnGetMenuTabItemState) {
      _foodList = state.updatedFoodCount;
      _beverageList = state.updatedBeverageCount;
      _isAnyMenuItemAdd = state.isAnyMenuItemSelected;
      _totalPrice = state.totalPrice;
    }
  }

  SliverToBoxAdapter _topWidget(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _carouselSlider(),
          _hotelTitle(context),
          _hotelAddressText(context),
        ],
      ),
    );
  }

  TabBarView _tabBarView(DetailState state) {
    return TabBarView(children: [
      AboutTab(
        aboutHotelDescription: _hotelDetail.about.description,
      ),
      MenuTab(
        detailBloc: _detailBloc,
        foodList: _foodList,
        beverageList: _beverageList,
        detailState: state,
      ),
      ReviewTab(reviews: _hotelDetail.review),
    ]);
  }

  SliverPersistentHeader _tabBar() {
    return SliverPersistentHeader(
        pinned: true,
        delegate: TabDelegate(
            tabBar: TabBar(tabs: [
          Tab(
            icon: Text(UiString.stringAsset.kAbout),
          ),
          Tab(
            icon: Text(UiString.stringAsset.kMenu),
          ),
          Tab(
            icon: Text(UiString.stringAsset.kReview),
          )
        ])));
  }

  Padding _hotelAddressText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        _hotelDetail.hotelAddress,
        style: Theme.of(context).textTheme.displayMedium,
      ),
    );
  }

  Padding _hotelTitle(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 20, left: 15),
        child: Text(
          _hotelDetail.hotelName,
          style: Theme.of(context).textTheme.labelLarge,
        ));
  }

  Widget _bottomSheet(BuildContext context) {
    return ColoredBox(
      color: Colors.amber,
      child: SizedBox(
        height: 80,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(UiString.stringAsset.kIDR + _totalPrice.toStringAsFixed(3)),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)))),
                  onPressed: () {},
                  child: Text(
                    _isAnyMenuItemAdd
                        ? UiString.stringAsset.kOrder
                        : UiString.stringAsset.kReservation,
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
