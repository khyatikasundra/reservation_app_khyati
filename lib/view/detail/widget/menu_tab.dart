import 'package:flutter/material.dart';
import 'package:reservation_app/model/menu_model.dart';
import 'package:reservation_app/strings/ui_string.dart';
import 'package:reservation_app/view/detail/bloc/detail_bloc.dart';
import 'package:reservation_app/view/detail/widget/menu_card.dart';

class MenuTab extends StatelessWidget {
  final List<FoodMenuModel> foodList;
  final List<FoodMenuModel> beverageList;
  final DetailBloc detailBloc;
  const MenuTab(
      {required this.foodList,
      required this.beverageList,
      required this.detailBloc,
      super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        _menuTitleText(context, UiString.stringAsset.kFoodMenu),
        _foodMenuList(),
        _menuTitleText(context, UiString.stringAsset.kBeverageMenu),
        _beverageMenuList(),
      ],
    );
  }

  Widget _foodMenuList() {
    return SliverList.builder(
        itemCount: foodList.length,
        itemBuilder: (context, index) => MenuCard(
            foodItem: foodList[index], index: index, detailBloc: detailBloc));
  }

  SliverList _beverageMenuList() {
    return SliverList.builder(
        itemCount: beverageList.length,
        itemBuilder: (context, index) => MenuCard(
            foodItem: beverageList[index],
            index: index,
            detailBloc: detailBloc));
  }

  Widget _menuTitleText(BuildContext context, String title) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          title,
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
    );
  }
}
