import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:manager/F1/menu.dart';
import 'package:manager/providers.dart/myProviderAct.dart';
import 'package:manager/F1/pageViewWidgetPage.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'listItems.dart';
import 'menuDetails.dart';
import 'dart:math' as math;

class Overview extends StatefulWidget {
  @override
  _OverviewState createState() => _OverviewState();
}

class _OverviewState extends State<Overview>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  Animation<double> _rotaeanimation;
  AnimationController _rotatecontroller;
  Animation _curve;

  int initialTab = 0;
  void initState() {
    super.initState();
    _rotatecontroller =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    _curve = CurvedAnimation(parent: _rotatecontroller, curve: Curves.easeIn);

    _rotaeanimation =
        Tween<double>(begin: 0.0, end: math.pi * 2).animate(_curve);
    _rotatecontroller.addListener(() {
      setState(() {});
    });

    _rotatecontroller.repeat();
  }

  void dispose() {
    _rotatecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    print(width);
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: Container(
                  height: height * 0.3,
                  width: width,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
              Divider(
                color: Colors.black.withOpacity(0.5),
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: ListTile(
                        title: Text(
                          'Reach',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 17),
                        ),
                        subtitle: Text(
                          '01 March 2021 - 30 Mar 2021',
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.black.withOpacity(0.5),
                              fontWeight: FontWeight.w400),
                        ),
                        trailing: buildExpandedIcon(height)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                      height: height * 0.3,
                      width: width,
                      color: Colors.white,
                      child: GridView.count(
                          childAspectRatio: 0.60,
                          crossAxisCount: 2,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: [
                            for (var i in reachList)
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: PhysicalModel(
                                  borderRadius: BorderRadius.circular(25),
                                  shadowColor: Colors.black,
                                  color: Colors.white,
                                  elevation: 10,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    child: Center(
                                        child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: CircleAvatar(
                                            backgroundColor: Colors
                                                .deepPurpleAccent
                                                .withOpacity(0.1),
                                            child: Icon(i.iconData),
                                          ),
                                        ),
                                        // SizedBox(
                                        //   width: 5,
                                        // ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(right: 5),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  i.title,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 12,
                                                      color: Colors.black
                                                          .withOpacity(0.5)),
                                                ),
                                                Text(
                                                  i.subTitle.toString(),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 26,
                                                      color: Colors.black),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    )),
                                  ),
                                ),
                              )
                          ]),
                    ),
                  ),
                ],
              ),
              Divider(
                color: Colors.black.withOpacity(0.5),
              ),
              Column(
                children: [
                  ListTile(
                    trailing: buildExpandedIcon(height),
                    subtitle: Text(
                      '10 Mar 2021-30 Mar 2021',
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                    ),
                    title: Text(
                      'Revenue',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Container(
                        height: height * 0.3,
                        child: SfCartesianChart(
                          primaryYAxis: NumericAxis(
                            majorGridLines: MajorGridLines(width: 0),
                            majorTickLines: MajorTickLines(width: 0),
                          ),
                          plotAreaBorderWidth: 0,
                          primaryXAxis: CategoryAxis(
                              majorGridLines: MajorGridLines(width: 0)),
                        )),
                  ),
                ],
              ),
              Divider(
                color: Colors.black.withOpacity(0.5),
              ),
              Column(
                children: [
                  ListTile(
                    trailing: GestureDetector(
                      onTap: () async {
                        await Provider.of<MyProvider>(context, listen: false)
                            .changeTab(2);
                      },
                      child: buildExpandedIcon(height),
                    ),
                    subtitle: Text(
                      '211 items serving of 330 items',
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                    ),
                    title: Text(
                      'Menu',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                      height: height * 0.30,
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Hero(tag: 'menu', child: PageviewWidget())),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Divider(
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.1,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        for (var menu in menuType)
                          GestureDetector(
                            child: buildMenuTypeWidget(
                                height, width, menu, context),
                            onTap: () async {
                              await Provider.of<MyProvider>(context,
                                      listen: false)
                                  .changeMenuType(menu);

                              Navigator.push(context,
                                  MaterialPageRoute(builder: (ctx) {
                                return MenuDetail();
                              }));
                            },
                          )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Divider(
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                  Column(
                    children: [
                      ListTile(
                        title: Text(
                          'Expense',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
                        ),
                        subtitle: Text(
                          '01 Mar 2021-30 Mar 2021',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                          ),
                        ),
                        trailing: buildExpandedIcon(height),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 15, bottom: 15, left: 15, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Rs:540,000',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 22,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '+2.40%',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Image.asset(
                                      'asset/arrowup.png',
                                      fit: BoxFit.fill,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                GestureDetector(
                                    onTap: () {},
                                    child: Text(
                                      'View All',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12),
                                    ))
                              ],
                            ),
                            SizedBox(
                              height: height * 0.3,
                              width: width * 0.3,
                              child: Center(
                                child: Stack(
                                  children: [
                                    Center(
                                      child: AnimatedBuilder(
                                        animation: _rotatecontroller,
                                        builder: (BuildContext context, _) {
                                          return Transform.rotate(
                                            angle: _rotaeanimation.value,
                                            child: Column(
                                              children: [
                                                Expanded(
                                                  child: Center(
                                                    child: Image.asset(
                                                      'asset/hd.png',
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    // Align(
                                    //   alignment: Alignment.center,
                                    //   child: Icon(
                                    //     Icons.arrow_forward_ios,
                                    //     size: 30,
                                    //   ),
                                    // )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Divider(
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.08,
                        width: width,
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 10,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (ctx, index) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    right: 8, left: 8, top: 15, bottom: 15),
                                child: Container(
                                  width: width * 0.35,
                                  child: Center(
                                    child: Text(
                                      '75% Entertainment',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.deepOrangeAccent,
                                      borderRadius: BorderRadius.circular(15)),
                                ),
                              );
                            }),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Divider(
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                  Column(
                    children: [
                      ListTile(
                        title: Text(
                          'Task',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
                        ),
                        subtitle: Text(
                          '55 Tasks pending of 110 Tasks',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                          ),
                        ),
                        trailing: buildExpandedIcon(height),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 15, bottom: 15, left: 15, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Daily Work Task',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 22,
                                      color: Colors.black.withOpacity(0.5)),
                                ),
                                SizedBox(
                                  height: 24,
                                ),
                                Container(
                                  width: width * 0.5,
                                  child: RichText(
                                    text: TextSpan(
                                        children: [
                                          TextSpan(
                                              text: ' 3/5 ',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                color: Colors.deepPurple[300],
                                              )),
                                          TextSpan(
                                              text: 'tasks are done today!',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 13))
                                        ],
                                        text: 'You marked',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 13)),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.15,
                              width: height * 0.15,
                              child: Image.asset(
                                'asset/expprog.png',
                                fit: BoxFit.fill,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 15,
                          right: 15,
                          top: 8.0,
                          bottom: 15,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                height: height * 0.05,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.pinkAccent[100]),
                                width: width * 0.33,
                                child: Center(
                                  child: Text(
                                    'Add Task',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 17),
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              'Total Tasks:24',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 19),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

buildExpandedIcon(double height) {
  return SizedBox(
    height: height * 0.05,
    width: height * 0.05,
    child: Image.asset(
      'asset/Expandicon.png',
      fit: BoxFit.fill,
    ),
  );
}

class Reach {
  String title;
  int subTitle;
  IconData iconData;
  Reach({this.title, this.subTitle, this.iconData});
}

class MenuItems {
  String type;
  String iamgeUrl;
  int totalItems;
  MenuItems({this.type, this.iamgeUrl, this.totalItems});
}
