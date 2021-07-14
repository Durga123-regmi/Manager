import 'package:flutter/cupertino.dart';

class Restaurant {
  String name;
  String imagePath;
  bool isSelected;
  int staff;
  int table;
  int product;
  String id;

  Restaurant(
      {this.name,
      this.imagePath,
      this.isSelected = false,
      this.staff,
      this.id,
      this.product,
      this.table});
}
