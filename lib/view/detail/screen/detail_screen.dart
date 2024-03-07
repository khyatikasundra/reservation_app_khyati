import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/model/about_model.dart';
import 'package:reservation_app/model/menu_model.dart';
import 'package:reservation_app/model/rest_model.dart';
import 'package:reservation_app/model/review_model.dart';
import 'package:reservation_app/strings/point_size.dart';
import 'package:reservation_app/strings/ui_string.dart';
import 'package:reservation_app/view/detail/bloc/detail_bloc.dart';
import 'package:reservation_app/view/detail/widget/about_tab.dart';
import 'package:reservation_app/view/detail/widget/custom_bottom_sheet.dart';
import 'package:reservation_app/view/detail/widget/menu_tab.dart';
import 'package:reservation_app/view/detail/widget/review_tab.dart';
import 'package:reservation_app/widget/material_loader.dart';

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
  double _totalPrice = 0;
  List<ReviewModel> _reviewList = [];
  bool _isLike = false;
  AboutModel _aboutModel = AboutModel(description: "");
  late RestModel _hotelDetail;

  @override
  void initState() {
    _detailBloc = context.read<DetailBloc>();
    _detailBloc.add(GetDetailPageInitialData(hotelId: widget.hotelId));
    _hotelDetail = RestModel(
        id: 90,
        about: AboutModel(description: ""),
        menu: MenuModel(drink: [], food: []),
        review: [],
        images: []);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DetailBloc, DetailState>(
      listener: (context, state) => _listener(state),
      builder: (context, state) {
        _detailBuildersLister(state);
        return Scaffold(
          appBar: _detailScreenAppBar(context),
          body: _detailScreenBody(state),
          bottomSheet: CustomBottomSheet(
            isAnyItemAdd: _isAnyMenuItemAdd,
            totalPrice: _totalPrice,
          ),
        );
      },
    );
  }

  //! Functions
  void _listener(DetailState state) {
    if (state is OnGetMenuTabItemState) {
      _foodList = state.updatedFoodCount;
      _beverageList = state.updatedBeverageCount;
      _isAnyMenuItemAdd = state.isAnyMenuItemSelected;
      _totalPrice = state.totalPrice;
    }
    if (state is OnGetDetailPageInitialData) {
      _hotelDetail = state.hotelDetail;
      _totalPrice = state.totalPrice;
      _detailBloc.add(GetAboutTabInitialData());
    }
  }

  void _detailBuildersLister(DetailState state) {
    if (state is OnGetReviewTabInitialData) {
      _reviewList = state.reviewList;
    }
    if (state is OnGetMenuTabInitialData) {
      _foodList = state.foodList;
      _beverageList = state.beverageList;
    }
    if (state is OnGetAboutTabInitialData) {
      _aboutModel = state.aboutHotel;
    }
    if (state is OnLikeUnLikeState) {
      _isLike = state.isLike;
    }
  }

//! Widget Method
  Widget _detailScreenBody(DetailState state) {
    return (state is DetailLoadingState)
        ? const MaterialLoader()
        : SafeArea(
            child: DefaultTabController(
            length: 3,
            child: NestedScrollView(
              headerSliverBuilder: (context, isScrolled) =>
                  [_topWidget(context), _tabBar()],
              body: _tabBarView(state),
            ),
          ));
  }

  AppBar _detailScreenAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      title: Center(child: Text(UiString.stringAsset.kDetailPlace)),
      actions: [
        IconButton(
            onPressed: () {
              _detailBloc.add(LikeUnLikeEvent(isLike: _isLike));
            },
            icon: _isLike
                ? const Icon(Icons.favorite)
                : const Icon(Icons.favorite_outline))
      ],
    );
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
        aboutHotelDescription: _aboutModel.description,
        detailBloc: _detailBloc,
        state: state,
      ),
      MenuTab(
        detailBloc: _detailBloc,
        foodList: _foodList,
        beverageList: _beverageList,
        detailState: state,
      ),
      ReviewTab(
        reviews: _reviewList,
        detailBloc: _detailBloc,
        detailState: state,
      ),
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
      padding: EdgeInsets.symmetric(horizontal: PointSize.value16),
      child: Text(
        _hotelDetail.hotelAddress,
        style: Theme.of(context).textTheme.displayMedium,
      ),
    );
  }

  Padding _hotelTitle(BuildContext context) {
    return Padding(
        padding:
            EdgeInsets.only(top: PointSize.value20, left: PointSize.value16),
        child: Text(
          _hotelDetail.hotelName,
          style: Theme.of(context).textTheme.labelLarge,
        ));
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
                height: PointSize.carouselHeight,
                width: PointSize.carouselWidth,
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
