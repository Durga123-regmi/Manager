import 'package:manager/F1/billModel.dart';
import 'package:manager/F1/jsonBillDecode.dart';

import 'package:flutter/material.dart';
import 'package:manager/F1/payBill.dart';
import 'package:table_calendar/table_calendar.dart';

import '../dateFormat.dart';

class ShowBillWithCalendar extends StatefulWidget {
  @override
  _ShowBillWithCalendarState createState() => _ShowBillWithCalendarState();
}

class _ShowBillWithCalendarState extends State<ShowBillWithCalendar> {
  String text = 'Due in 7 days';
  List<BillModel> billList;
  CalendarController _controller = CalendarController();
  Map<DateTime, List<dynamic>> _events;
  List<dynamic> _bills;

  void initState() {
    super.initState();
    getBillList();
    _bills = [];
  }

  getBillList() async {
    billList = await getmodelBillList();
    _events = getEvent(billList);
    return _events;
  }

  Map<DateTime, List<dynamic>> getEvent(List<BillModel> bills) {
    Map<DateTime, List<dynamic>> _data = {};
    bills.forEach((element) {
      setState(() {
        DateTime date = DateTime(element.dateTime.year, element.dateTime.month,
            element.dateTime.day, 12);
        if (_data[date] == null) _data[date] = [];
        _data[date].add(element);
      });
    });
    return _data;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: height * 1 / 30,
                  width: height * 1 / 30,
                  child: Center(
                      child: Image.asset(
                    'asset/Vector.png',
                    fit: BoxFit.fill,
                  ))),
              SizedBox(
                width: 10,
              ),
              Center(
                child: IconButton(
                    icon: Icon(
                      Icons.add,
                      color: Colors.black,
                      size: 30,
                    ),
                    onPressed: () {}),
              )
            ],
          )
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            color: Colors.black,
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      backgroundColor: Colors.grey[400],
      body: Column(
        children: [
          Expanded(
              flex: 3,
              child: Container(
                child: Center(
                  child: TableCalendar(
                    onDaySelected: (date, events, _) {
                      setState(() {
                        _bills = events;
                      });
                    },
                    availableCalendarFormats: {CalendarFormat.month: 'Month'},
                    headerStyle: HeaderStyle(
                      centerHeaderTitle: true,
                    ),
                    events: _events,
                    calendarStyle: CalendarStyle(
                        markersMaxAmount: 1,
                        markersPositionBottom: 0,
                        contentPadding: EdgeInsets.all(15),
                        contentDecoration: BoxDecoration(),
                        selectedColor: Colors.deepPurple,
                        cellMargin: EdgeInsets.all(2.0),
                        markersAlignment: Alignment.bottomCenter,
                        markersColor: Colors.red),
                    rowHeight: 35,
                    calendarController: _controller,
                  ),
                ),
                color: Colors.white,
              )),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                width: width,
                color: Colors.white,
                child: SingleChildScrollView(
                    child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: _bills.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (ctx) {
                                    return PayBill(
                                        data: _bills[index], text: text);
                                  }));
                                },
                                leading: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 5, bottom: 5),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(5)),
                                    height: MediaQuery.of(context).size.height *
                                        1 /
                                        10,
                                    width: MediaQuery.of(context).size.height *
                                        1 /
                                        18,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 4,
                                          child: Text(
                                            formatDate(_bills[index].dateTime)
                                                .toString(),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                            flex: 1,
                                            child:
                                                Divider(color: Colors.white)),
                                        Expanded(
                                            flex: 4,
                                            child: Text(
                                              _bills[index]
                                                  .dateTime
                                                  .day
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                                title: Text(
                                  _bills[index].title.toString(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                                subtitle: Text(text.toString()),
                                trailing: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Rs ' + _bills[index].ammount.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16),
                                    ),
                                    Text(
                                      _bills[index].category.toString(),
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.5),
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ));
                        })),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
