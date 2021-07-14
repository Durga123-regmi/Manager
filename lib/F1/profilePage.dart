import 'dart:async';
import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:manager/F1/about.dart';
import 'package:manager/F1/menu.dart';
import 'package:manager/providers.dart/myProviderAct.dart';
import 'package:manager/F1/overView.dart';
import 'package:manager/F1/staffWidget.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with TickerProviderStateMixin {
  int initialPageIndex = 0;
  AnimationController _controller;
  PageController _pageController;
  Color _color = Colors.white;
  ScrollController _scrollController;
  String restroName;
  bool expand = true;
  TabController _tabController;

  void initState() {
    super.initState();
    _tabController = TabController(
      length: _textTab.length,
      vsync: this,
    );
    _tabController.addListener(() {});

    _pageController =
        PageController(viewportFraction: 0.3, initialPage: initialPageIndex);

    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    Timer(Duration(milliseconds: 200), () {
      _controller.forward();
    });

    _controller.addListener(() {
      setState(() {});
    });

    _scrollController = ScrollController()
      ..addListener(() {
        if (_isAppBarExpanded) {
          setState(() {
            _color = Colors.black;
          });
        } else {
          _color = Colors.white;
        }
      });
  }

  void dispose() {
    _tabController.dispose();
    _controller.dispose();
    super.dispose();
  }

  bool get _isAppBarExpanded {
    return _scrollController.hasClients &&
        _scrollController.offset >
            (MediaQuery.of(context).size.height * 0.6 - kToolbarHeight);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Consumer<MyProvider>(
      builder: (BuildContext context, _restros, _) {
        _tabController.animateTo(_restros.initialTab);
        return SafeArea(
          child: Scaffold(
            body: CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverAppBar(
                  stretch: true,
                  title: Text(
                    _isAppBarExpanded
                        ? _restros.restaurants[initialPageIndex].name
                        : '',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                    ),
                  ),
                  leading: Icon(
                    Icons.arrow_back_ios,
                    color: _color,
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20, bottom: 20, right: 20, left: 20),
                      child: SizedBox(
                        height: height * 0.03,
                        width: height * 0.03,
                        child: _isAppBarExpanded
                            ? Image.asset(
                                'asset/chartB.png',
                                fit: BoxFit.fill,
                              )
                            : Image.asset(
                                'asset/chart.png',
                                fit: BoxFit.fill,
                              ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, bottom: 20, right: 20),
                      child: SizedBox(
                        height: height * 0.03,
                        width: height * 0.03,
                        child: _isAppBarExpanded
                            ? Image.asset(
                                'asset/settingB.png',
                                fit: BoxFit.fill,
                              )
                            : Image.asset(
                                'asset/setting.png',
                                fit: BoxFit.fill,
                              ),
                      ),
                    )
                  ],
                  backgroundColor: Colors.transparent,
                  onStretchTrigger: () async {
                    setState(() {
                      _color = Colors.black;
                    });
                  },
                  centerTitle: true,
                  pinned: true,
                  elevation: 0,
                  snap: false,
                  primary: false,
                  floating: true,
                  expandedHeight: height * 0.6,
                  flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      background: Stack(
                        clipBehavior: Clip.antiAlias,
                        children: [
                          Column(
                            children: [
                              Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  height: height * 0.3,
                                  child: Image.asset(
                                    'asset/background.png',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  color: Colors.white,
                                  height: height * 0.3,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(top: 40),
                                        child: FadeTransition(
                                          opacity: _controller,
                                          child: Text(
                                            _restros
                                                .restaurants[initialPageIndex]
                                                .name,
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                      Text(_restros
                                          .restaurants[initialPageIndex].id),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0, horizontal: 40),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  _restros
                                                      .restaurants[
                                                          initialPageIndex]
                                                      .staff
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Text('Staff')
                                              ],
                                            )),
                                            Expanded(
                                                child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  _restros
                                                      .restaurants[
                                                          initialPageIndex]
                                                      .table
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                Text('Tables')
                                              ],
                                            )),
                                            Expanded(
                                                child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  _restros
                                                      .restaurants[
                                                          initialPageIndex]
                                                      .product
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                Text('Products')
                                              ],
                                            ))
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Align(
                              alignment: Alignment.center,
                              child: PageView.builder(
                                  onPageChanged: (index) {
                                    print(index);
                                    changedIndexOfItem(index, _restros);
                                  },
                                  pageSnapping: true,
                                  controller: _pageController,
                                  itemCount: _restros.restaurants.length,
                                  itemBuilder: (ctx, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          expand = false;
                                        });
                                      },
                                      child: Center(
                                        child: PhysicalModel(
                                          shadowColor: Colors.black,
                                          shape: BoxShape.circle,
                                          color: Colors.white,
                                          elevation: 50,
                                          child: AnimatedContainer(
                                            curve: Curves.easeIn,
                                            duration:
                                                Duration(milliseconds: 400),
                                            child: Image.asset(
                                              _restros
                                                  .restaurants[index].imagePath,
                                              fit: BoxFit.fill,
                                            ),
                                            height: index == initialPageIndex
                                                ? height * 0.15
                                                : height * 0.10,
                                            width: index == initialPageIndex
                                                ? height * 0.15
                                                : height * 0.10,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                      spreadRadius: 0.5,
                                                      color: Colors.black12,
                                                      blurRadius: 0.1)
                                                ],
                                                shape: BoxShape.circle),
                                          ),
                                        ),
                                      ),
                                    );
                                  })),
                        ],
                      )),
                ),
                SliverFillRemaining(
                    child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                      padding: const EdgeInsets.only(top: 60),
                      child: DefaultTabController(
                          length: _tabBarView.length,
                          child: Center(
                            child: Column(children: [
                              SizedBox(
                                height: height * 0.035,
                                width: width,
                                child: TabBar(
                                    controller: _tabController,
                                    onTap: (index) {},
                                    indicatorColor: Colors.grey[400],
                                    tabs: _textTab),
                              ),
                              Expanded(
                                  child: TabBarView(
                                      controller: _tabController,
                                      children: _tabBarView))
                            ]),
                          ))),
                ))
              ],
            ),
          ),
        );
      },
    );
  }

  List<Widget> _tabBarView = [
    Overview(),
    StaffWidget(),
    Menu(),
    About(),
  ];

  List<Widget> _textTab = [
    Text(
      'Overview',
      style: TextStyle(
          color: Colors.black, fontWeight: FontWeight.w500, fontSize: 14),
    ),
    Text(
      'Staff',
      style: TextStyle(
          color: Colors.black, fontWeight: FontWeight.w500, fontSize: 14),
    ),
    Text(
      'Menu',
      style: TextStyle(
          color: Colors.black, fontWeight: FontWeight.w500, fontSize: 14),
    ),
    Text(
      'About',
      style: TextStyle(
          color: Colors.black, fontWeight: FontWeight.w500, fontSize: 14),
    )
  ];

  void changedIndexOfItem(int index, MyProvider _restros) {
    setState(() {
      _controller.reset();
      _controller.forward();
      initialPageIndex = index;
      restroName = _restros.restaurants[index].name;
    });
  }
}
