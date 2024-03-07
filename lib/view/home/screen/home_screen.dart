import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/model/rest_model.dart';
import 'package:reservation_app/strings/point_size.dart';
import 'package:reservation_app/strings/ui_string.dart';
import 'package:reservation_app/view/detail/screen/detail_page.dart';
import 'package:reservation_app/view/home/cubit/home_cubit.dart';
import 'package:reservation_app/view/home/widget/popular_section_card.dart';
import 'package:reservation_app/view/home/widget/recommended_section_card.dart';
import 'package:reservation_app/view/profile/cubit/profile_cubit.dart';
import 'package:reservation_app/widget/material_loader.dart';
import 'package:reservation_app/widget/sliver_loader.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeCubit _homeCubit;
  late ProfileCubit _profileCubit;
  List<RestModel> _recommendedHotelList = [];
  List<RestModel> _popularHotelList = [];
  @override
  void initState() {
    _homeCubit = context.read<HomeCubit>();
    _profileCubit = context.read<ProfileCubit>();
    _profileCubit.getProfilePageInitialData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, profileState) => _profileListener(profileState),
      builder: (context, profileState) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: _homeAppBar(context, profileState),
        body: _homeBody(profileState),
      ),
    );
  }

//! Functions
  void _profileListener(ProfileState profileState) {
    if (profileState is OnGetProfilePageInitialData) {
      _homeCubit.getHomeInitialData();
    }
  }

  void _homeListener(HomeState state, BuildContext context) {
    if (state is OnGetRecommendedItemSelected) {
      Navigator.of(context, rootNavigator: true).push(
        MaterialPageRoute(
          builder: (BuildContext context) {
            return DetailPage(
              hotelId: state.selectedHotelId,
            );
          },
        ),
      );
    }
  }

  void _homeBuilder(HomeState state) {
    if (state is OnGetHomeInitialDataSuccessful) {
      _recommendedHotelList = state.recommendedList;
      _popularHotelList = state.popularList;
    }
  }

//! Widget Method

  BlocConsumer<HomeCubit, HomeState> _homeBody(ProfileState profileState) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) => _homeListener(state, context),
      builder: (context, state) {
        _homeBuilder(state);
        return SafeArea(
          top: false,
          child: CustomScrollView(
            slivers: [
              _topWidget(context, state, profileState),
              (state is HomeLoadingState || profileState is ProfileLoadingState)
                  ? const SliverLoader()
                  : _popularPlaceListBuilder()
            ],
          ),
        );
      },
    );
  }

  SliverList _popularPlaceListBuilder() {
    return SliverList.builder(
      itemCount: _popularHotelList.length,
      itemBuilder: (context, index) => PopularSectionCard(
        popularItem: _popularHotelList[index],
      ),
    );
  }

  AppBar _homeAppBar(BuildContext context, ProfileState profileState) {
    return AppBar(
      backgroundColor: Colors.red,
      title: _homeAppBarTitle(context),
      actions: [_profileImage(profileState)],
    );
  }

  Padding _profileImage(ProfileState profileState) {
    return Padding(
      padding:  EdgeInsets.only(right: PointSize.value20),
      child: CircleAvatar(
        foregroundImage: profileState is OnGetProfilePageInitialData
            ? NetworkImage(profileState.profileImageUrl)
            : null,
        child: Text(UiString.stringAsset.kKK),
      ),
    );
  }

  Padding _homeAppBarTitle(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: PointSize.value10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          UiString.stringAsset.kGoodMorning,
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ),
    );
  }

  Widget _topWidget(
          BuildContext context, HomeState state, ProfileState profileState) =>
      SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _balanceCardWidget(context),
            _sectionTitleText(context, UiString.stringAsset.kRecommendedPlace),
            _recommendedListBuilder(context, state, profileState),
            _sectionTitleText(context, UiString.stringAsset.kPopularPlaces),
          ],
        ),
      );

  Widget _balanceCardWidget(BuildContext context) {
    return SizedBox(
      height: PointSize.homeBalanceCardHeight,
      child: Stack(children: [_backgroundContainer(), _balanceCard(context)]),
    );
  }

  Widget _backgroundContainer() => Container(
        margin: EdgeInsets.only(bottom: PointSize.value40),
        color: Colors.red,
      );
  Widget _balanceCard(BuildContext context) => Positioned(
        top: 90,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: _card(),
        ),
      );

  Widget _card() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: PointSize.value20),
      child: Card(
        elevation: 12,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: PointSize.value20, vertical: PointSize.value30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(UiString.stringAsset.kYourCardBalance),
              Text(UiString.stringAsset.kIDR125),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionTitleText(BuildContext context, String title) {
    return Padding(
      padding: EdgeInsets.all(PointSize.value8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.labelLarge,
      ),
    );
  }

  Widget _recommendedListBuilder(
      BuildContext context, HomeState state, ProfileState profileState) {
    return SizedBox(
      height: PointSize.homeRecommendationSectionHeight,
      width: MediaQuery.of(context).size.width,
      child: (state is HomeLoadingState || profileState is ProfileLoadingState)
          ? const MaterialLoader()
          : _recommendationList(),
    );
  }

  Widget _recommendationList() {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _recommendedHotelList.length,
        itemBuilder: (context, index) => RecommendedSectionCard(
              recommendedItem: _recommendedHotelList[index],
              onPress: () {
                _homeCubit.selectedHotelData(
                    hotelId: _recommendedHotelList[index].id);
              },
            ));
  }
}
