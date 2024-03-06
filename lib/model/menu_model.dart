import 'package:reservation_app/strings/ui_string.dart';

// enum FoodCategory { food, beverage }

class MenuModel {
  final List<FoodMenuModel> food;
  final List<FoodMenuModel> drink;

  MenuModel({required this.food, required this.drink});
}

class FoodMenuModel {
  final String id;
  final String menuName;
  final int menuPrice;
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
      menuPrice: 35,
      id: "F1"),
  FoodMenuModel(
      menuName: UiString.stringAsset.kChilliPepperCheeseFries,
      menuPrice: 35,
      id: "F2"),
  FoodMenuModel(
      menuName: UiString.stringAsset.kFlamingHotWings, menuPrice: 30, id: "F3"),
  FoodMenuModel(
      menuName: UiString.stringAsset.kSpicyThaiBasilChicken,
      menuPrice: 45,
      id: "F4")
];

// class BeverageMenuModel {
//   final String id;
//   final String drinkName;
//   final int drinkPrice;
//   int count;
//   BeverageMenuModel(
//       {required this.drinkName,
//       required this.drinkPrice,
//       required this.id,
//       this.count = 0});
// }

final List<FoodMenuModel> drinkList = [
  FoodMenuModel(
      menuName: UiString.stringAsset.kSpicedGuavaRefresher,
      menuPrice: 20,
      id: "B1"),
  FoodMenuModel(
      menuName: UiString.stringAsset.kSzechuanSpickenIcedTea,
      menuPrice: 25,
      id: "B2"),
  FoodMenuModel(
      menuName: UiString.stringAsset.kJalapenoMintJulep,
      menuPrice: 30,
      id: "B3")
];

// class MenuModel {
//   final String food;
//   final int price;
//   MenuModel({required this.food, required this.price});
// }
// List<MenuModel> menuFoodList = [
//   MenuModel(
//     food: UiString.stringAsset.kFireCrackerChickenTenders,
//     price: 35,
//   ),
//   MenuModel(
//     food: UiString.stringAsset.kChilliPepperCheeseFries,
//     price: 35,
//   ),
//   MenuModel(
//     food: UiString.stringAsset.kFlamingHotWings,
//     price: 30,
//   ),
//   MenuModel(
//     food: UiString.stringAsset.kSpicyThaiBasilChicken,
//     price: 45,
//   ),
// ];
// List<MenuModel> menuDrinkList = [
//   MenuModel(
//     food: UiString.stringAsset.kSpicedGuavaRefresher,
//     price: 20,
//   ),
//   MenuModel(
//     food: UiString.stringAsset.kSzechuanSpickenIcedTea,
//     price: 25,
//   ),
//   MenuModel(
//     food: UiString.stringAsset.kJalapenoMintJulep,
//     price: 30,
//   )
// ];
