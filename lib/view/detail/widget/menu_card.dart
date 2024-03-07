import 'package:flutter/material.dart';
import 'package:reservation_app/model/menu_model.dart';
import 'package:reservation_app/strings/point_size.dart';
import 'package:reservation_app/strings/ui_string.dart';
import 'package:reservation_app/view/detail/bloc/detail_bloc.dart';

class MenuCard extends StatelessWidget {
  final DetailBloc detailBloc;
  final FoodMenuModel foodItem;
  final int index;
  const MenuCard(
      {required this.foodItem,
      required this.index,
      required this.detailBloc,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(PointSize.value8),
      child: Card(
        child: ListTile(
          title: Text(foodItem.menuName),
          subtitle: Text(foodItem.menuPrice.toStringAsFixed(2)),
          trailing: _addQuantity(context),
        ),
      ),
    );
  }

//! Function
  void _addRemove(bool isSelected) {
    return detailBloc.add(ItemAddRemoveEvent(
      index: index,
      addOrRemove: isSelected,
      menuId: foodItem.id,
    ));
  }
//! Widget Method

  Widget _addQuantity(BuildContext context) {
    return foodItem.count == 0 ? _countAtZeroAddButton(context) : _counter();
  }

  Widget _countAtZeroAddButton(BuildContext context) => ElevatedButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
      onPressed: () => detailBloc.add(GetAddQuantityEvent(
            index: index,
            menuId: foodItem.id,
          )),
      child: Text(
        UiString.stringAsset.kAdd,
        style: Theme.of(context).textTheme.displaySmall,
      ));

  Widget _counter() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
            onPressed: () => _addRemove(false), icon: const Icon(Icons.remove)),
        Text(foodItem.count.toString()),
        IconButton(
            onPressed: () => _addRemove(true), icon: const Icon(Icons.add)),
      ],
    );
  }
}
