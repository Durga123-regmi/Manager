import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:manager/F1/animatedIncExp.dart';
import 'package:manager/F1/homeWidget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartForIncomeExp extends StatefulWidget {
  @override
  _ChartForIncomeExpState createState() => _ChartForIncomeExpState();
}

class _ChartForIncomeExpState extends State<ChartForIncomeExp>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  bool show = false;
  List<IncomeExp> _incomeList;
  void initState() {
    super.initState();
    _incomeList = list();
    _tabController = TabController(length: tabWidget().length, vsync: this);
  }

  double heght = 0.0;

  List<IncomeExp> list() {
    if (tab == 1) {
      return _netWorth();
    } else if (tab == 2) {
      return _expList();
    } else
      return _netWorth();
  }

  expandHeight(double ht) {
    if (show) {
      heght = 0.0;
    } else {
      heght = ht * 0.25;
    }
  }

  int tab = 1;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.black,
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            'Quick Chart',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                setState(() {
                  this.show = !show;
                });
                expandHeight(height);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    height: height * 1 / 30,
                    width: height * 1 / 30,
                    child: Center(
                      child: Image.asset(
                        'asset/Calendar.png',
                        fit: BoxFit.fill,
                      ),
                    )),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            GestureDetector(
              onVerticalDragStart: (detail) {
                print(detail.globalPosition.dy);
                if (detail.localPosition.dy > 0.0) {
                  setState(() {
                    this.heght = 0.0;
                  });
                }
              },
              child: PhysicalModel(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
                elevation: 20,
                color: Colors.white,
                shadowColor: Colors.black,
                child: AnimatedContainer(
                  child: heght == height * 0.25
                      ? Column(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  width: width,
                                  height: height * 0.05,
                                  decoration: BoxDecoration(
                                      color: Colors.grey[400],
                                      borderRadius: BorderRadius.circular(25)),
                                  child: Row(
                                    children: [
                                      buildContainerForDateSort(
                                        1,
                                        'Week',
                                      ),
                                      buildContainerForDateSort(2, 'Months'),
                                      buildContainerForDateSort(
                                        3,
                                        'Year',
                                      ),
                                      buildContainerForDateSort(
                                        4,
                                        'Custom',
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Container(),
                            )
                          ],
                        )
                      : Text(''),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15)),
                    color: Colors.white,
                  ),
                  curve: Curves.easeInOutSine,
                  duration: Duration(milliseconds: 400),
                  height: heght,
                  width: width,
                ),
              ),
            ),
            TabBar(
              indicatorColor: Colors.transparent,
              controller: _tabController,
              tabs: tabWidget(),
              isScrollable: true,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey[400],
            ),
            buildDividerWidget(height, width),
            Expanded(
              child: TabBarView(
                  physics: BouncingScrollPhysics(),
                  controller: _tabController,
                  children: [
                    for (var i in tabWidget())
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Container(
                                width: width,
                                height: height * 0.05,
                                decoration: BoxDecoration(
                                    color: Colors.grey[400],
                                    borderRadius: BorderRadius.circular(25)),
                                child: Row(
                                  children: [
                                    buildContainer(
                                        1, 'Net Worth', Colors.blueGrey),
                                    buildContainer(2, 'Expense', Colors.red),
                                    buildContainer(3, 'Income', Colors.green),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 30, bottom: 0, left: 0, right: 10),
                              child: SizedBox(
                                height: height * 0.35,
                                width: width,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, bottom: 10),
                                      child: Text(
                                        'Rs',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 11),
                                      ),
                                    ),
                                    Expanded(
                                      child: SfCartesianChart(
                                        margin: EdgeInsets.all(0),
                                        plotAreaBorderWidth: 0,
                                        crosshairBehavior: CrosshairBehavior(
                                            activationMode:
                                                ActivationMode.singleTap,
                                            lineColor: tab == 1
                                                ? Colors.blue
                                                : tab == 2
                                                    ? Colors.red
                                                    : tab == 3
                                                        ? Colors.green
                                                        : null,
                                            enable: true),
                                        enableAxisAnimation: true,
                                        tooltipBehavior:
                                            TooltipBehavior(enable: true),
                                        primaryYAxis: NumericAxis(
                                            majorGridLines: MajorGridLines(
                                              dashArray: [1, 2],
                                              width: 1.5,
                                            ),
                                            isVisible: true,
                                            majorTickLines: MajorTickLines(
                                                color: tab == 1
                                                    ? Colors.blueGrey
                                                    : tab == 2
                                                        ? Colors.red
                                                        : Colors.green,
                                                size: 5,
                                                width: 1),
                                            axisLine: AxisLine(width: 0),
                                            enableAutoIntervalOnZooming: true,
                                            labelStyle: TextStyle(
                                                color: Colors.grey[400]),
                                            labelFormat: '{value}k',
                                            numberFormat: NumberFormat.currency(
                                                symbol: '', decimalDigits: 0)),
                                        primaryXAxis: NumericAxis(
                                            majorGridLines:
                                                MajorGridLines(width: 0),
                                            title: AxisTitle(
                                                text: 'Day',
                                                textStyle: TextStyle(
                                                    color: Colors.grey[400])),
                                            enableAutoIntervalOnZooming: true,
                                            edgeLabelPlacement:
                                                EdgeLabelPlacement.shift),
                                        series: <ChartSeries>[
                                          AreaSeries<IncomeExp, double>(
                                              gradient: LinearGradient(
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  stops: [
                                                    0.4,
                                                    0.6
                                                  ],
                                                  colors: [
                                                    tab == 1
                                                        ? Colors.blueGrey[100]
                                                        : tab == 2
                                                            ? Colors.red[100]
                                                            : tab == 3
                                                                ? Colors
                                                                    .green[100]
                                                                : null,
                                                    tab == 1
                                                        ? Colors.blueGrey[100]
                                                            .withOpacity(0.5)
                                                        : tab == 2
                                                            ? Colors.red[100]
                                                                .withOpacity(
                                                                    0.5)
                                                            : Colors.green[100]
                                                                .withOpacity(
                                                                    0.5)
                                                  ]),
                                              borderWidth: 2,
                                              borderColor: tab == 1
                                                  ? Colors.blueGrey[700]
                                                  : tab == 2
                                                      ? Colors.redAccent[700]
                                                      : Colors.greenAccent[700],
                                              borderDrawMode:
                                                  BorderDrawMode.top,
                                              opacity: 1,
                                              color: tab == 1
                                                  ? Colors.blue
                                                  : tab == 2
                                                      ? Colors.red
                                                      : tab == 3
                                                          ? Colors.lightGreen
                                                          : null,
                                              markerSettings: MarkerSettings(
                                                borderWidth: 1,
                                                color: tab == 1
                                                    ? Colors.blueGrey[700]
                                                    : tab == 2
                                                        ? Colors.redAccent[700]
                                                        : Colors
                                                            .greenAccent[700],
                                                isVisible: true,
                                                height: 5,
                                                width: 5,
                                                shape: DataMarkerType.circle,
                                              ),
                                              name: 'Net Worth',
                                              enableTooltip: true,
                                              // dataLabelSettings: DataLabelSettings(

                                              //    ),
                                              dataSource: tab == 1
                                                  ? _netWorth()
                                                  : tab == 2
                                                      ? _expList()
                                                      : _netWorth(),
                                              xValueMapper:
                                                  (IncomeExp inc, _) => inc.day,
                                              yValueMapper:
                                                  (IncomeExp inc, _) =>
                                                      inc.income)
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: height * 0.30,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                        color: Colors.grey[400],
                                        width: 0.5,
                                      )),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Center(
                                              child: AnimatedIncExp(
                                            color: Colors.red[200],
                                            text1: 'e',
                                          )),
                                          Text(
                                            'Expense',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                          ),
                                          Text(
                                            'Rs 5066667.0',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 19,
                                                fontWeight: FontWeight.w400),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: height * 0.30,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                        color: Colors.grey[400],
                                        width: 0.5,
                                      )),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Center(
                                              child: AnimatedIncExp(
                                            color: Colors.green[200],
                                            text1: 'i',
                                          )),
                                          Text(
                                            'Income',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                          ),
                                          Text(
                                            'Rs 60305305.0',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 19,
                                                fontWeight: FontWeight.w400),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                  ]),
            ),
          ],
        ),
      ),
    );
  }

  buildContainer(int i, String s, Color color) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            tab = i;
          });
        },
        child: Container(
          child: Center(
              child: Text(
            s.toString(),
            style: TextStyle(color: tab == i ? Colors.white : Colors.black),
          )),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: tab == i ? color : Colors.grey[400]),
        ),
      ),
    );
  }

  int tabForSort = 1;
  buildContainerForDateSort(
    int i,
    String s,
  ) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            tabForSort = i;
          });
        },
        child: Container(
          child: Center(
              child: Text(
            s.toString(),
            style:
                TextStyle(color: tabForSort == i ? Colors.white : Colors.black),
          )),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: tabForSort == i ? Colors.blue : Colors.grey[400]),
        ),
      ),
    );
  }

  List<IncomeExp> _netWorth() {
    final List<IncomeExp> _incomeData = [
      IncomeExp(day: 1, income: 5),
      IncomeExp(day: 2, income: 10),
      IncomeExp(day: 3, income: 8),
      IncomeExp(day: 4, income: 15),
      IncomeExp(day: 5, income: 20),
      IncomeExp(day: 6, income: 13),
      IncomeExp(day: 7, income: 12),
      IncomeExp(day: 8, income: 7),
      IncomeExp(day: 9, income: 9),
      IncomeExp(day: 10, income: 11),
      IncomeExp(day: 11, income: 5),
      IncomeExp(day: 12, income: 10),
      IncomeExp(day: 13, income: 8),
      IncomeExp(day: 14, income: 15),
      IncomeExp(day: 15, income: 20),
      IncomeExp(day: 16, income: 13),
      IncomeExp(day: 17, income: 12),
      IncomeExp(day: 18, income: 7),
      IncomeExp(day: 19, income: 9),
      IncomeExp(day: 20, income: 11),
    ];
    return _incomeData;
  }

  List<IncomeExp> _expList() {
    final List<IncomeExp> _expData = [
      IncomeExp(day: 1, income: 5),
      IncomeExp(day: 2, income: 8),
      IncomeExp(day: 3, income: 20),
      IncomeExp(day: 4, income: 14),
      IncomeExp(day: 5, income: 13),
      IncomeExp(day: 6, income: 16),
      IncomeExp(day: 7, income: 10),
      IncomeExp(day: 8, income: 9),
      IncomeExp(day: 9, income: 15),
      IncomeExp(day: 10, income: 5),
    ];
    return _expData;
  }
}

buildDividerWidget(double height, double width) {
  return Row(
    children: [
      Expanded(
          flex: 1,
          child: Divider(
            thickness: 1,
          )),
      SizedBox(
        height: height * 0.01,
        width: height * 0.01,
        child: Align(
          alignment: Alignment.topCenter,
          child: Image.asset(
            'asset/arrowu.png',
            fit: BoxFit.fill,
          ),
        ),
      ),
      Expanded(
          flex: 1,
          child: Divider(
            thickness: 1,
          )),
    ],
  );
}

List<Widget> tabWidget() {
  final _tabWidget = List.generate(12, (index) {
    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 10, right: 30, left: 30),
      child: GestureDetector(
        child: Text(
          '0$index May 2021',
        ),
      ),
    );
  });
  return _tabWidget;
}

class IncomeExp {
  final double day;
  final double income;
  IncomeExp({this.day, this.income});
}
