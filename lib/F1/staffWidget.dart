import 'dart:math';

import 'package:flutter/material.dart';
import 'package:manager/F1/chartPageForIncExp.dart';
import 'package:manager/F1/listItems.dart';

class StaffWidget extends StatefulWidget {
  @override
  _StaffWidgetState createState() => _StaffWidgetState();
}

class _StaffWidgetState extends State<StaffWidget>
    with TickerProviderStateMixin {
  TabController _tabController;
  int initialTab = 0;

  void initState() {
    super.initState();

    _tabController = TabController(
        length: post.length, vsync: this, initialIndex: initialTab);
  }

  @override
  Widget build(BuildContext context) {
    print(initialTab);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: SizedBox(
          height: height * 0.125,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              shrinkWrap: true,
              itemBuilder: (ctx, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12.5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '29',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 19),
                                    ),
                                    Text(
                                      'staffs',
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.5),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: height * 0.0525,
                                  width: height * 0.0525,
                                  decoration: BoxDecoration(
                                      color: Colors.lightBlueAccent[100]
                                          .withOpacity(0.5),
                                      shape: BoxShape.circle),
                                  child: Center(
                                    child: Image.asset(
                                      'asset/bag.png',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.trending_up_sharp,
                                        size: 20, color: Colors.green),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Text(
                                      '3.46%',
                                      style: TextStyle(
                                          color: Colors.green, fontSize: 13),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Since last month',
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.black.withOpacity(0.5)),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      width: width * 0.475,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.transparent.withOpacity(0.05)),
                    ),
                  ),
                );
              }),
        ),
      ),
      TabBar(
          onTap: (tab) {
            setState(() {
              initialTab = tab;
            });
          },
          physics: BouncingScrollPhysics(),
          controller: _tabController,
          indicatorPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          labelPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          indicatorColor: Colors.grey[400],
          unselectedLabelColor: Colors.black.withOpacity(0.5),
          labelColor: Colors.black,
          isScrollable: true,
          tabs: [for (var i in post) Text(i)]),
      Expanded(
          child: TabBarView(
              controller: _tabController,
              children: [for (var i in post) buildListTile()])),
    ]);
  }

  buildListTile() {
    return SingleChildScrollView(
      child: Column(
        children: [
          for (var i in staffList)
            ListTile(
              title: Text(i.name),
              subtitle: Text(i.post),
              leading: CircleAvatar(
                radius: 20,
                child: Image.asset(i.imageUrl),
              ),
            )
        ],
      ),
    );
  }
}
