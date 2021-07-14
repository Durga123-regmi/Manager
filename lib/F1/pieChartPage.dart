import 'package:flutter/material.dart';
import 'package:manager/F1/animatedIncExp.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'chartPageForIncExp.dart';
import 'dart:math' as math;

import 'incomeExpDetail.dart';

class PieChartPage extends StatefulWidget {
  final String s;
  PieChartPage({this.s});

  @override
  _PieChartPageState createState() => _PieChartPageState();
}

class _PieChartPageState extends State<PieChartPage>
    with SingleTickerProviderStateMixin {
  ConnectorType _connectorType;
  ChartDataLabelPosition _labelPosition;

  TabController _tabcontroller;
  double wi = 0;

  void initState() {
    super.initState();
    increaseWidth();
    _tabcontroller = TabController(length: tabWidget().length, vsync: this);
    _connectorType = ConnectorType.curve;
    _labelPosition = ChartDataLabelPosition.outside;
  }

  void increaseWidth() {
    {
      setState(() {
        wi += 265.0909090909091;
      });
    }
  }

  int getSumI() {
    int s = 0;
    _getListInc().forEach((element) {
      s += element.ammount;
    });
    print(s.toString());
    return s;
  }

  int getSumE() {
    int s = 0;
    _getListExp().forEach((element) {
      s += element.ammount;
    });
    print(s.toString());
    return s;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    print(width * 0.675);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.black,
          ),
          centerTitle: true,
          title: Text(
            widget.s == 'e' ? 'Expense' : 'Income',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.black.withOpacity(0.5),
              isScrollable: true,
              controller: _tabcontroller,
              tabs: tabWidget(),
              indicatorColor: Colors.transparent,
            ),
            buildDividerWidget(height, width),
            Expanded(
              child: TabBarView(
                controller: _tabcontroller,
                children: [
                  for (var i in tabWidget())
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Center(
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 8, bottom: 8, left: 10, right: 10),
                                  child: SizedBox(
                                    height: height * 0.35,
                                    width: height * 0.35,
                                    child: Center(
                                      child: SfCircularChart(
                                        margin:
                                            EdgeInsets.only(left: 5, right: 5),
                                        enableMultiSelection: true,
                                        tooltipBehavior:
                                            TooltipBehavior(enable: true),
                                        series: <CircularSeries>[
                                          DoughnutSeries<IncomeExpDetailPie,
                                              String>(
                                            cornerStyle: CornerStyle.bothFlat,
                                            explodeIndex: 0,
                                            explodeOffset: '10%',
                                            explode: true,
                                            enableSmartLabels: true,
                                            enableTooltip: true,
                                            dataLabelSettings: DataLabelSettings(
                                                showCumulativeValues: true,
                                                // connectorLineSettings:
                                                //     ConnectorLineSettings(
                                                //         type:
                                                //             _connectorType),
                                                isVisible: true,
                                                labelPosition: _labelPosition),
                                            radius: '65%',
                                            dataSource: widget.s == 'e'
                                                ? _getListExp()
                                                : _getListInc(),
                                            xValueMapper:
                                                (IncomeExpDetailPie _incforPie,
                                                        _) =>
                                                    _incforPie.category,
                                            yValueMapper:
                                                (IncomeExpDetailPie _incforPie,
                                                        _) =>
                                                    _incforPie.ammount,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Opacity(
                                    opacity: 0.4,
                                    child: PhysicalModel(
                                      shadowColor: Colors.black,
                                      color: Colors.white,
                                      elevation: 100,
                                      shape: BoxShape.circle,
                                      child: Container(
                                        height: height * 0.12,
                                        width: height * 0.12,
                                        decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            shape: BoxShape.circle),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Text(
                            widget.s == 'e' ? 'Expense' : 'Income',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'Rs 20003020',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            child: Divider(
                              thickness: 1,
                            ),
                          ),
                          ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: widget.s == 'e'
                                  ? _getListExp().length
                                  : _getListInc().length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (ctx) {
                                      return IncomeExpensesDetailPage(
                                          widget.s == 'e'
                                              ? _getListExp()[index]
                                              : _getListInc()[index]);
                                    }));
                                  },
                                  child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: CircleAvatar(
                                                radius: 25,
                                                backgroundColor: widget.s == 'e'
                                                    ? Colors.red[300]
                                                    : Colors.green[300],
                                              ),
                                            ),
                                            Expanded(
                                              flex: 4,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                            widget.s == 'e'
                                                                ? _getListExp()[
                                                                        index]
                                                                    .category
                                                                : _getListInc()[
                                                                        index]
                                                                    .category,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 14)),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 20,
                                                                  right: 20),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                widget.s == 'e'
                                                                    ? ((_getListExp()[index].ammount / getSumE()) *
                                                                                100)
                                                                            .round()
                                                                            .toString() +
                                                                        '%'
                                                                    : ((_getListInc()[index].ammount / getSumI()) *
                                                                                100)
                                                                            .round()
                                                                            .toString() +
                                                                        '%',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        11),
                                                              ),
                                                              SizedBox(
                                                                width: 5,
                                                              ),
                                                              Text(
                                                                widget.s == 'e'
                                                                    ? 'Rs ' +
                                                                        _getListExp()[index]
                                                                            .ammount
                                                                            .toString()
                                                                    : 'Rs ' +
                                                                        _getListInc()[index]
                                                                            .ammount
                                                                            .toString(),
                                                                style: TextStyle(
                                                                    color: widget.s ==
                                                                            'e'
                                                                        ? Colors.red[
                                                                            300]
                                                                        : Colors.green[
                                                                            300],
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        14),
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Container(
                                                      height: height * 0.015,
                                                      width: width * 0.675,
                                                      decoration: BoxDecoration(
                                                          color:
                                                              Colors.grey[400],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                      child: Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child:
                                                            AnimatedContainer(
                                                          width: widget.s == 'e'
                                                              ? wi *
                                                                  (((_getListExp()[index].ammount /
                                                                              getSumE()) *
                                                                          100) /
                                                                      100)
                                                              : wi *
                                                                  (((_getListInc()[index].ammount /
                                                                              getSumI()) *
                                                                          100) /
                                                                      100),
                                                          height:
                                                              height * 0.015,
                                                          decoration: BoxDecoration(
                                                              color: widget.s ==
                                                                      'e'
                                                                  ? Colors
                                                                      .red[300]
                                                                  : Colors.green[
                                                                      300],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          curve: Curves.easeIn,
                                                          duration: Duration(
                                                              milliseconds:
                                                                  500),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                );
                              })
                        ],
                      ),
                    )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  List<IncomeExpDetailPie> _getListExp() {
    List<IncomeExpDetailPie> listExp = [
      IncomeExpDetailPie(category: 'Food', ammount: 10000),
      IncomeExpDetailPie(category: 'Office', ammount: 20000),
      IncomeExpDetailPie(category: 'Household', ammount: 3000),
      IncomeExpDetailPie(category: 'Salary', ammount: 50000),
      IncomeExpDetailPie(category: 'Entertainment', ammount: 100000),
    ];
    return listExp;
  }

  List<IncomeExpDetailPie> _getListInc() {
    List<IncomeExpDetailPie> listInc = [
      IncomeExpDetailPie(category: 'Sales', ammount: 30000),
      IncomeExpDetailPie(category: 'Commision', ammount: 20000),
      IncomeExpDetailPie(category: 'Cash', ammount: 100000),
      IncomeExpDetailPie(category: 'Salary', ammount: 50000),
      IncomeExpDetailPie(category: 'Entertainment', ammount: 60000),
    ];
    return listInc;
  }
}

class IncomeExpDetailPie {
  String category;
  int ammount;
  IncomeExpDetailPie({this.category, this.ammount});
}
