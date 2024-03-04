import 'package:reservation_app/strings/ui_string.dart';

// enum FoodCategory { food, beverage }

class MenuModel {
  final List<FoodMenuModel> food;
  final List<BeverageMenuModel> drink;

  MenuModel({required this.food, required this.drink});
}

class FoodMenuModel {
  final String id;
  final String dishName;
  final int dishPrice;
  int count;
  FoodMenuModel(
      {required this.id,
      required this.dishName,
      required this.dishPrice,
      this.count = 0});
}

List<FoodMenuModel> foodList = [
  FoodMenuModel(
      dishName: UiString.stringAsset.kFireCrackerChickenTenders,
      dishPrice: 35,
      id: "F1"),
  FoodMenuModel(
      dishName: UiString.stringAsset.kChilliPepperCheeseFries,
      dishPrice: 35,
      id: "F2"),
  FoodMenuModel(
      dishName: UiString.stringAsset.kFlamingHotWings, dishPrice: 30, id: "F3"),
  FoodMenuModel(
      dishName: UiString.stringAsset.kSpicyThaiBasilChicken,
      dishPrice: 45,
      id: "F4")
];

class BeverageMenuModel {
  final String id;
  final String drinkName;
  final int drinkPrice;
  int count;
  BeverageMenuModel(
      {required this.drinkName,
      required this.drinkPrice,
      required this.id,
      this.count = 0});
}

List<BeverageMenuModel> drinkList = [
  BeverageMenuModel(
      drinkName: UiString.stringAsset.kSpicedGuavaRefresher,
      drinkPrice: 20,
      id: "B1"),
  BeverageMenuModel(
      drinkName: UiString.stringAsset.kSzechuanSpickenIcedTea,
      drinkPrice: 25,
      id: "B2"),
  BeverageMenuModel(
      drinkName: UiString.stringAsset.kJalapenoMintJulep,
      drinkPrice: 30,
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
