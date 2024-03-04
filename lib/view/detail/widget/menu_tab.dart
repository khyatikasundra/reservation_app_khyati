import 'package:flutter/material.dart';
import 'package:reservation_app/model/menu_model.dart';
import 'package:reservation_app/strings/ui_string.dart';
import 'package:reservation_app/view/detail/bloc/detail_bloc.dart';

class MenuTab extends StatelessWidget {
  final List<FoodMenuModel> foodList;
  final List<BeverageMenuModel> beverageList;
  final DetailBloc detailBloc;
  final int count;
  final String foodIdSelected;
  const MenuTab(
      {required this.foodList,
      required this.beverageList,
      required this.detailBloc,
      required this.foodIdSelected,
      required this.count,
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
        itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: ListTile(
                  title: Text(foodList[index].dishName),
                  subtitle: Text(foodList[index].dishPrice.toString()),
                  trailing: foodList[index].count == 0
                      ? ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10)))),
                          onPressed: () => detailBloc.add(GetAddQuantityEvent(
                                index: index,
                                menuId: foodList[index].id,
                              )),
                          child: Text(
                            UiString.stringAsset.kAdd,
                            style: Theme.of(context).textTheme.displaySmall,
                          ))
                      : Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                onPressed: () =>
                                    detailBloc.add(ItemAddRemoveEvent(
                                      index: index,
                                      addOrRemove: false,
                                      menuId: foodList[index].id,
                                    )),
                                icon: const Icon(Icons.remove)),
                            Text(foodList[index].count.toString()),
                            IconButton(
                                onPressed: () => detailBloc.add(
                                    ItemAddRemoveEvent(
                                        addOrRemove: true,
                                        menuId: foodList[index].id,
                                        index: index)),
                                icon: const Icon(Icons.add)),
                          ],
                        ),
                ),
              ),
            ));
  }

  SliverList _beverageMenuList() {
    return SliverList.builder(
        itemCount: beverageList.length,
        itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: ListTile(
                  title: Text(beverageList[index].drinkName),
                  subtitle: Text(beverageList[index].drinkPrice.toString()),
                  trailing: beverageList[index].count == 0
                      ? ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10)))),
                          onPressed: () => detailBloc.add(GetAddQuantityEvent(
                                index: index,
                                menuId: drinkList[index].id,
                              )),
                          child: Text(
                            UiString.stringAsset.kAdd,
                            style: Theme.of(context).textTheme.displaySmall,
                          ))
                      : Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                onPressed: () => detailBloc.add(
                                    ItemAddRemoveEvent(
                                        addOrRemove: false,
                                        menuId: beverageList[index].id,
                                        index: index)),
                                icon: const Icon(Icons.remove)),
                            Text(beverageList[index].count.toString()),
                            IconButton(
                                onPressed: () => detailBloc.add(
                                    ItemAddRemoveEvent(
                                        addOrRemove: true,
                                        menuId: beverageList[index].id,
                                        index: index)),
                                icon: const Icon(Icons.add)),
                          ],
                        ),
                ),
              ),
            ));
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
