import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:manager/F1/billModel.dart';
import 'package:manager/F1/jsonBillDecode.dart';
import 'package:manager/F1/listItems.dart';
import 'package:manager/F1/restaurantsModel.dart';
import 'package:provider/provider.dart';

class MyProvider extends ChangeNotifier {
  List<PayMentHistory> payHistory = [];

  int initialTab = 0;
  MenuTypes initialMenuType = menuType.first;

  changeMenuType(MenuTypes menu) async {
    initialMenuType = menu;
    notifyListeners();
  }

  Restaurant initialRestaurant = new Restaurant(
      name: 'Food Bank Restro.',
      imagePath: 'asset/foodbank.png',
      isSelected: true,
      staff: 29,
      table: 56,
      product: 245,
      id: '@foodbankrestro');

  changeTab(int tab) async {
    initialTab = tab;
    notifyListeners();
  }

  changeRestaurantName(Restaurant restro) async {
    initialRestaurant = restro;

    notifyListeners();
  }

  addToPaidHistoryList(PayMentHistory history) async {
    payHistory.insert(0, history);
    notifyListeners();
  }

  List<Restaurant> restaurants = [
    Restaurant(
        name: 'Food Bank Restro.',
        imagePath: 'asset/foodbank.png',
        isSelected: true,
        staff: 29,
        table: 56,
        product: 245,
        id: '@foodbankrestro'),
    Restaurant(
        name: 'BullDog Bar.',
        imagePath: 'asset/bulldog.png',
        staff: 35,
        table: 65,
        product: 290,
        id: '@bulldogbar'),
    Restaurant(
        name: 'iBlues Restro.',
        imagePath: 'asset/iblues.png',
        staff: 45,
        table: 70,
        product: 300,
        id: '@ibluesrestro')
  ];
}

class PayMentHistory {
  final DateTime createdDate;
  final String title;

  final String category;
  final DateTime paidDate;

  final int ammount;
  PayMentHistory(
      {this.title,
      this.category,
      this.paidDate,
      this.ammount,
      this.createdDate});
}
