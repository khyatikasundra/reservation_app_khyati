import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/model/rest_model.dart';
import 'package:reservation_app/strings/ui_string.dart';
import 'package:reservation_app/view/detail/screen/detail_page.dart';
import 'package:reservation_app/view/home/cubit/home_cubit.dart';
import 'package:reservation_app/view/home/widget/popular_section_card.dart';
import 'package:reservation_app/view/home/widget/recommended_section_card.dart';
import 'package:reservation_app/view/profile/cubit/profile_cubit.dart';

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
      listener: (context, profileState) => {
        if (profileState is OnGetProfilePageInitialData)
          {_homeCubit.getHomeInitialData()}
      },
      builder: (context, profileState) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              UiString.stringAsset.kGoodMorning,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: CircleAvatar(
                foregroundImage: profileState is OnGetProfilePageInitialData
                    ? NetworkImage(profileState.profileImageUrl)
                    : null,
                child: const Text("KK"),
              ),
            )
          ],
        ),
        body: _topWidget(profileState),
      ),
    );
  }

  BlocConsumer<HomeCubit, HomeState> _topWidget(ProfileState profileState) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is OnGetRecommendedItemSelected) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(
                hotelId: state.selectedHotelId,
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is OnGetHomeInitialDataSuccessful) {
          _recommendedHotelList = state.recommendedList;
          _popularHotelList = state.popularList;
        }
        return SafeArea(
          top: false,
          child: CustomScrollView(
            slivers: [
              _topBalanceContainer(context, state, profileState),
              (state is HomeLoadingState || profileState is ProfileLoadingState)
                  ? const SliverToBoxAdapter(
                      child: Center(
                        child: SizedBox(
                            width: 30,
                            height: 30,
                            child: CircularProgressIndicator()),
                      ),
                    )
                  : SliverList.builder(
                      itemCount: _popularHotelList.length,
                      itemBuilder: (context, index) => PopularSectionCard(
                          popularItem: _popularHotelList[index]))
            ],
          ),
        );
      },
    );
  }

  SliverToBoxAdapter _topBalanceContainer(
          BuildContext context, HomeState state, ProfileState profileState) =>
      SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 180,
              child: Stack(
                  children: [_backgroundContainer(), _balanceCard(context)]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                UiString.stringAsset.kRecommendedPlace,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
            SizedBox(
              height: 230,
              width: MediaQuery.of(context).size.width,
              child: (state is HomeLoadingState ||
                      profileState is ProfileLoadingState)
                  ? const Center(
                      child: SizedBox(
                          width: 30,
                          height: 30,
                          child: CircularProgressIndicator()),
                    )
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _recommendedHotelList.length,
                      itemBuilder: (context, index) => RecommendedSectionCard(
                            recommendedItem: _recommendedHotelList[index],
                            onPress: () {
                              _homeCubit.selectedHotelData(
                                  hotelId: _recommendedHotelList[index].id);
                            },
                          )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                UiString.stringAsset.kPopularPlaces,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            )
          ],
        ),
      );

  Container _backgroundContainer() => Container(
        margin: const EdgeInsets.only(bottom: 40),
        color: Colors.red,
      );

  Positioned _balanceCard(BuildContext context) => Positioned(
        top: 90,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: _card(),
        ),
      );

  Padding _card() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        elevation: 12,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
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
}
