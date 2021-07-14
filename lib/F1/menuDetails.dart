import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:manager/F1/listItems.dart';
import 'package:manager/providers.dart/myProviderAct.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:ui' as ui;

import 'chooseMenuFromBottomSheet.dart';
import 'chooseRestaurant.dart';

class MenuDetail extends StatefulWidget {
  @override
  _MenuDetailState createState() => _MenuDetailState();
}

class _MenuDetailState extends State<MenuDetail>
    with SingleTickerProviderStateMixin {
  TabController _tabcontroller;

  void initState() {
    super.initState();
    _tabcontroller = TabController(length: menuCategories.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Consumer<MyProvider>(
      builder: (BuildContext context, _menuType, _) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios),
              color: Colors.black,
            ),
            centerTitle: true,
            title: InkWell(
              splashColor: Colors.grey,
              onLongPress: () {
                showButtomSheetToChoosMenu();
              },
              child: Text(
                _menuType.initialMenuType.type,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: DefaultTabController(
              length: menuCategories.length,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TabBar(
                    labelColor: Colors.black,
                    controller: _tabcontroller,
                    unselectedLabelColor: Colors.grey[400],
                    indicatorColor: Colors.grey[400],
                    isScrollable: true,
                    tabs: [
                      for (var i in menuCategories)
                        Text(
                          i,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: TabBarView(controller: _tabcontroller, children: [
                        for (var i in menuCategories)
                          buildMenuDetailList(height, width)
                      ]),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  buildMenuDetailList(double height, double width) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var i in itemTypeList)
            Padding(
              padding: const EdgeInsets.only(
                bottom: 30,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 8,
                      bottom: 8,
                    ),
                    child: Text(
                      i.title,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 17),
                    ),
                  ),
                  for (var i in i.itemAndPrice.entries)
                    Padding(
                      padding: EdgeInsets.only(top: 3, left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            i.key.toString(),
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.5),
                                fontWeight: FontWeight.w400,
                                fontSize: 17),
                          ),
                          Text(
                            'Rs ' + i.value.toString(),
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontWeight: FontWeight.w400,
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                    )
                ],
              ),
            ),
        ],
      ),
    );
  }

  void showButtomSheetToChoosMenu() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25))),
        context: context,
        builder: (ctx) {
          return ChooseMenuFromBottomSheet();
        });
  }
}
