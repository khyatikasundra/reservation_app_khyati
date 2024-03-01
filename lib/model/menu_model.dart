import 'package:reservation_app/strings/ui_string.dart';

class MenuModel {
  final List<FoodMenuModel> food;
  final List<BeverageMenuModel> drink;
  MenuModel({required this.food, required this.drink});
}

class FoodMenuModel {
  final String dishName;
  final int dishPrice;
  FoodMenuModel({required this.dishName, required this.dishPrice});
}

List<FoodMenuModel> foodList = [
  FoodMenuModel(
      dishName: UiString.stringAsset.kFireCrackerChickenTenders, dishPrice: 35),
  FoodMenuModel(
      dishName: UiString.stringAsset.kChilliPepperCheeseFries, dishPrice: 35),
  FoodMenuModel(dishName: UiString.stringAsset.kFlamingHotWings, dishPrice: 0),
  FoodMenuModel(
      dishName: UiString.stringAsset.kSpicyThaiBasilChicken, dishPrice: 45)
];

class BeverageMenuModel {
  final String drinkName;
  final int drinkPrice;
  BeverageMenuModel({required this.drinkName, required this.drinkPrice});
}

List<BeverageMenuModel> drinkList = [
  BeverageMenuModel(
      drinkName: UiString.stringAsset.kSpicedGuavaRefresher, drinkPrice: 20),
  BeverageMenuModel(
      drinkName: UiString.stringAsset.kSzechuanSpickenIcedTea, drinkPrice: 25),
  BeverageMenuModel(
      drinkName: UiString.stringAsset.kJalapenoMintJulep, drinkPrice: 30)
];
