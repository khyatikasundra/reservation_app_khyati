import 'package:reservation_app/strings/ui_string.dart';

class MenuModel {
  final List<FoodMenuModel> food;
  final List<FoodMenuModel> drink;

  MenuModel({required this.food, required this.drink});
}

class FoodMenuModel {
  final String id;
  final String menuName;
  final double menuPrice;
  final int count;

  FoodMenuModel({
    required this.id,
    required this.menuName,
    required this.menuPrice,
    this.count = 0,
  });

  FoodMenuModel copyWith({
    int? count,
  }) {
    return FoodMenuModel(
      id: id,
      menuName: menuName,
      menuPrice: menuPrice,
      count: count ?? this.count,
    );
  }
}

final List<FoodMenuModel> foodList = [
  FoodMenuModel(
      menuName: UiString.stringAsset.kFireCrackerChickenTenders,
      menuPrice: 35.567,
      id: "F1"),
  FoodMenuModel(
      menuName: UiString.stringAsset.kChilliPepperCheeseFries,
      menuPrice: 35.76,
      id: "F2"),
  FoodMenuModel(
      menuName: UiString.stringAsset.kFlamingHotWings, menuPrice: 30, id: "F3"),
  FoodMenuModel(
      menuName: UiString.stringAsset.kSpicyThaiBasilChicken,
      menuPrice: 45.12,
      id: "F4")
];

final List<FoodMenuModel> drinkList = [
  FoodMenuModel(
      menuName: UiString.stringAsset.kSpicedGuavaRefresher,
      menuPrice: 20.23,
      id: "B1"),
  FoodMenuModel(
      menuName: UiString.stringAsset.kSzechuanSpickenIcedTea,
      menuPrice: 25.111,
      id: "B2"),
  FoodMenuModel(
      menuName: UiString.stringAsset.kJalapenoMintJulep,
      menuPrice: 30.366,
      id: "B3")
];
