import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/model/rest_model.dart';
import 'package:reservation_app/strings/ui_string.dart';
import 'package:reservation_app/view/detail/screen/detail_page.dart';
import 'package:reservation_app/view/home/bloc/home_bloc.dart';
import 'package:reservation_app/view/home/widget/popular_section_card.dart';
import 'package:reservation_app/view/home/widget/recommended_section_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeBloc _homeBloc;
  List<RestModel> _recommendedHotelList = [];
  @override
  void initState() {
    _homeBloc = context.read<HomeBloc>();
    _homeBloc.add(GetHomeInitialData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is OnGetHomeInitialDataSuccessful) {
            _recommendedHotelList = state.recommendedList;
          }
          if (state is OnGetRecommendedItemSelected) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailPage(
                          hotelId: state.selectedHotelId,
                        )));
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: CustomScrollView(
              slivers: [
                _topBalanceContainer(context),
                SliverList.builder(
                    itemCount: hotelList.length,
                    itemBuilder: (context, index) =>
                        PopularSectionCard(popularItem: hotelList[index]))
              ],
            ),
          );
        },
      ),
    );
  }

  SliverToBoxAdapter _topBalanceContainer(BuildContext context) =>
      SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
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
              height: 240,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _recommendedHotelList.length,
                  itemBuilder: (context, index) => RecommendedSectionCard(
                        recommendedItem: _recommendedHotelList[index],
                        onPress: () {
                          _homeBloc.add(GetRecommendedCardSelected(
                              hotelId: _recommendedHotelList[index].id));
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
        margin: const EdgeInsets.only(bottom: 50),
        color: Colors.red,
      );

  Positioned _balanceCard(BuildContext context) => Positioned(
        top: 100,
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
