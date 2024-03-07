import 'package:flutter/material.dart';
import 'package:reservation_app/model/menu_model.dart';
import 'package:reservation_app/strings/point_size.dart';
import 'package:reservation_app/strings/ui_string.dart';
import 'package:reservation_app/view/detail/bloc/detail_bloc.dart';
import 'package:reservation_app/view/detail/widget/menu_card.dart';
import 'package:reservation_app/widget/material_loader.dart';

class MenuTab extends StatefulWidget {
  final List<FoodMenuModel> foodList;
  final List<FoodMenuModel> beverageList;
  final DetailBloc detailBloc;
  final DetailState detailState;
  const MenuTab(
      {required this.foodList,
      required this.beverageList,
      required this.detailBloc,
      required this.detailState,
      super.key});

  @override
  State<MenuTab> createState() => _MenuTabState();
}

class _MenuTabState extends State<MenuTab> with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    widget.detailBloc.add(GetMenuTabInitialData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.detailState is MenuLoadingState
        ? const MaterialLoader()
        : CustomScrollView(
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
        itemCount: widget.foodList.length,
        itemBuilder: (context, index) => MenuCard(
            foodItem: widget.foodList[index],
            index: index,
            detailBloc: widget.detailBloc));
  }

  Widget _beverageMenuList() {
    return SliverList.builder(
        itemCount: widget.beverageList.length,
        itemBuilder: (context, index) => MenuCard(
            foodItem: widget.beverageList[index],
            index: index,
            detailBloc: widget.detailBloc));
  }

  Widget _menuTitleText(BuildContext context, String title) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(PointSize.value10),
        child: Text(
          title,
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
