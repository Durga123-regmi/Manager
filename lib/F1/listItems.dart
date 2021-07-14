import 'package:flutter/material.dart';
import 'overView.dart';

List<MenuItems> menuItems = [
  MenuItems(type: 'Breakfast', iamgeUrl: 'asset/breakfast.png', totalItems: 35),
  MenuItems(type: 'Dinner', iamgeUrl: 'asset/dinner.png', totalItems: 33),
  MenuItems(type: 'Lunch', iamgeUrl: 'asset/lunch.png', totalItems: 23),
  MenuItems(type: 'Dinner', iamgeUrl: 'asset/dinner.png', totalItems: 22),
  MenuItems(type: 'Dinner', iamgeUrl: 'asset/dinner.png', totalItems: 22),
  MenuItems(type: 'Dinner', iamgeUrl: 'asset/dinner.png', totalItems: 22),
  MenuItems(type: 'Dinner', iamgeUrl: 'asset/dinner.png', totalItems: 22),
];

List<MenuTypes> menuType = [
  MenuTypes(type: 'Dine in Menu', noOfItems: 211, url: 'asset/dinein.png'),
  MenuTypes(type: "New Year's Menu", noOfItems: 211, url: 'asset/newYear.png'),
  MenuTypes(type: 'Friday Night Menu', noOfItems: 211, url: 'asset/fryday.png'),
  MenuTypes(type: 'Christmas Menu', noOfItems: 211, url: 'asset/Christmas.png'),
  MenuTypes(type: 'Delivery Menu', noOfItems: 211, url: 'asset/delivery.png'),
  MenuTypes(type: 'Take Away Menu', noOfItems: 211, url: 'asset/takeaway.png'),
  MenuTypes(
      type: 'Dine in -Alternate', noOfItems: 211, url: 'asset/alternate.png'),
];

List<String> menuCategories = [
  'All Food',
  'Spicy',
  'Dressing',
  'Piro',
  'Tato',
  'Sweets',
  'Veg',
  'Non Veg'
];

List<Reach> reachList = [
  Reach(
    title: 'Visit',
    subTitle: 2435,
    iconData: Icons.trending_up,
  ),
  Reach(title: 'Likes', subTitle: 654, iconData: Icons.thumb_up),
  Reach(title: 'Favorite', subTitle: 855, iconData: Icons.favorite),
  Reach(title: 'Views', subTitle: 5677, iconData: Icons.remove_red_eye),
  Reach(title: 'Views', subTitle: 5677, iconData: Icons.remove_red_eye),
  Reach(title: 'Views', subTitle: 5677, iconData: Icons.remove_red_eye),
];

Map<String, dynamic> _itemAndPrice = {
  'Berries': 120,
  'Cold Cereal': 130,
  'Cottage Cheese': 120,
  'Eggs': 50,
  'Green Tea': 140,
  'Oatmeal': 120,
  'Peanut Butter': 110
};

List<Update> updateLizt = [
  Update(
      name: 'Swadesh Nepali',
      subName: '@restroX',
      imageUrl: 'asset/profilephoto.png',
      descTitle: 'While Corfu give us ',
      descImage: 'asset/Cat.png',
      desc:
          "A product description is the marketing copy that explains what a product is and why it’s worth purchasing. The purpose of a product description is to supply customers with important information about the features and benefits of the product so they’re compelled to buy",
      like: 235,
      comment: 45),
  Update(
      name: 'Swadesh Nepali',
      subName: '@owner',
      imageUrl: 'asset/profilephoto2.png',
      descTitle: 'Hey! Cechkout these',
      desc: 'hmm hmm hmm bla bla bla bla ha ha ha',
      like: 235,
      comment: 45),
  Update(
      name: 'Swadesh Nepali',
      subName: '@owner',
      imageUrl: 'asset/profilephoto2.png',
      descTitle: 'Hey! Cechkout these',
      descImage: 'asset/Cat.png',
      desc:
          'A product description is the marketing copy that explains what a product is and why it’s worth purchasing. The purpose of a product description is to supply customers with important information about the features and benefits of the product so they’re compelled to buyA product description is the marketing copy that explains what a product is and why it’s worth purchasing. The purpose of a product description is to supply customers with important information about the features and benefits of the product so they’re compelled to buyA product description is the marketing copy that explains what a product is and why it’s worth purchasing. The purpose of a product description is to supply customers with important information about the features and benefits of the product so they’re compelled to buy',
      like: 235,
      comment: 45),
  Update(
      name: 'Swadesh Nepali',
      subName: '@owner',
      imageUrl: 'asset/profilephoto.png',
      descTitle: 'Hey! Cechkout these',
      descImage: 'asset/Cat.png',
      desc: 'hmm hmm hmm bla bla bla bla ha ha ha',
      like: 235,
      comment: 45),
  Update(
      name: 'Swadesh Nepali',
      subName: '@owner',
      imageUrl: 'asset/profilephoto2.png',
      descTitle: 'Hey! Cechkout these',
      descImage: 'asset/Cat.png',
      desc: 'hmm hmm hmm bla bla bla bla ha ha ha',
      like: 235,
      comment: 45),
];

List<MenuItemTypes> itemTypeList = [
  MenuItemTypes(title: 'Breakast', itemAndPrice: _itemAndPrice),
  MenuItemTypes(title: 'Salad', itemAndPrice: _itemAndPrice),
  MenuItemTypes(title: 'Chicken', itemAndPrice: _itemAndPrice),
  MenuItemTypes(title: 'Breakast', itemAndPrice: _itemAndPrice),
  MenuItemTypes(title: 'Breakast', itemAndPrice: _itemAndPrice)
];

List<Staffs> staffList = [
  Staffs(
      id: 1,
      name: 'Durga Prasad Regmi',
      post: 'Manager',
      imageUrl: 'asset/profilephoto.png'),
  Staffs(
      id: 2,
      name: 'Binod Banstola',
      post: 'Reception',
      imageUrl: 'asset/profilephoto.png'),
  Staffs(
      id: 3,
      name: 'Manish Paudel',
      post: 'Waiter',
      imageUrl: 'asset/profilephoto.png'),
  Staffs(
      id: 4,
      name: 'Swadesh Nepali',
      post: 'Manager',
      imageUrl: 'asset/profilephoto.png'),
  Staffs(
      id: 5, name: 'Binod', post: 'Chef', imageUrl: 'asset/profilephoto.png'),
  Staffs(
      id: 6,
      name: 'Adarsha',
      post: 'Helper',
      imageUrl: 'asset/profilephoto.png'),
  Staffs(
      id: 7,
      name: 'Sitaram',
      post: 'Assistant',
      imageUrl: 'asset/profilephoto.png'),
  Staffs(
      id: 8,
      name: 'Durga Prasad Regmi',
      post: 'Manager',
      imageUrl: 'asset/profilephoto.png'),
  Staffs(
      id: 9,
      name: 'Binod Banstola',
      post: 'Reception',
      imageUrl: 'asset/profilephoto.png'),
  Staffs(
      id: 10,
      name: 'Manish Paudel',
      post: 'Waiter',
      imageUrl: 'asset/profilephoto.png'),
  Staffs(
      id: 11,
      name: 'Swadesh Nepali',
      post: 'Manager',
      imageUrl: 'asset/profilephoto.png'),
  Staffs(
      id: 12, name: 'Binod', post: 'Chef', imageUrl: 'asset/profilephoto.png'),
  Staffs(
      id: 13,
      name: 'Adarsha',
      post: 'Helper',
      imageUrl: 'asset/profilephoto.png'),
  Staffs(
      id: 14,
      name: 'Sitaram',
      post: 'Assistant',
      imageUrl: 'asset/profilephoto.png'),
  Staffs(
      id: 15,
      name: 'Durga Prasad Regmi',
      post: 'Manager',
      imageUrl: 'asset/profilephoto.png'),
  Staffs(
      id: 16,
      name: 'Binod Banstola',
      post: 'Reception',
      imageUrl: 'asset/profilephoto.png'),
  Staffs(
      id: 17,
      name: 'Manish Paudel',
      post: 'Waiter',
      imageUrl: 'asset/profilephoto.png'),
  Staffs(
      id: 18,
      name: 'Swadesh Nepali',
      post: 'Manager',
      imageUrl: 'asset/profilephoto.png'),
  Staffs(
      id: 19, name: 'Binod', post: 'Chef', imageUrl: 'asset/profilephoto.png'),
  Staffs(
      id: 20,
      name: 'Adarsha',
      post: 'Helper',
      imageUrl: 'asset/profilephoto.png'),
  Staffs(
      id: 21,
      name: 'Sitaram',
      post: 'Assistant',
      imageUrl: 'asset/profilephoto.png'),
];

List<String> post = [
  'All Staff',
  'Manager',
  'Reception',
  'Waiter',
  'Chef',
  'Helper',
  'Assistant'
];

class MenuItemTypes {
  final String title;
  final Map<String, dynamic> itemAndPrice;

  MenuItemTypes({this.title, this.itemAndPrice});
}

class MenuTypes {
  final String type;
  final int noOfItems;
  final String url;

  MenuTypes({this.type, this.noOfItems, this.url});
}

class Staffs {
  String name;
  String post;
  int id;
  String imageUrl;

  Staffs({this.name, this.id, this.post, this.imageUrl});
}

class Update {
  String name;
  String subName;
  String imageUrl;
  String descImage;
  String descTitle;
  String desc;
  int like;
  bool isLiked;
  int comment;
  bool isSaved;

  Update(
      {this.name,
      this.subName,
      this.imageUrl,
      this.descImage,
      this.descTitle,
      this.desc,
      this.like,
      this.isLiked = false,
      this.comment,
      this.isSaved = false});
}
