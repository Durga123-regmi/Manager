import 'package:flutter/material.dart';
import 'package:manager/providers.dart/myProviderAct.dart';
import 'package:manager/F1/restaurantsModel.dart';
import 'package:manager/F1/updatePage.dart';

class NotificationClass extends StatefulWidget {
  @override
  _NotificationClassState createState() => _NotificationClassState();
}

class _NotificationClassState extends State<NotificationClass> {
  void initState() {
    super.initState();
    getNotification();
  }

  int tab = 1;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 70,
            title: Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 20, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        tab = 1;
                      });
                    },
                    child: Container(
                      height: height * 0.045,
                      width: width * 0.25,
                      decoration: BoxDecoration(
                          color: tab == 1 ? Colors.black : Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Text(
                          'Activity',
                          style: TextStyle(
                            color: tab == 1 ? Colors.white : Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        tab = 2;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: tab == 2 ? Colors.black : Colors.white,
                      ),
                      height: height * 0.045,
                      width: width * 0.25,
                      child: Center(
                        child: Text(
                          'Updates',
                          style: TextStyle(
                            color: tab == 2 ? Colors.white : Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          body: tab == 1
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                          scrollDirection: Axis.vertical,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: getNotification().length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(15),
                              child: Container(
                                height: height * 0.10,
                                width: width,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: CircleAvatar(
                                        radius: 25,
                                        backgroundColor: Colors.grey[400],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: Padding(
                                        padding:
                                            EdgeInsets.only(left: 5, right: 5),
                                        child: Wrap(
                                          direction: Axis.horizontal,
                                          children: [
                                            Text(
                                              buildNotiFicationText(
                                                index,
                                              ),
                                              style: TextStyle(),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                        flex: 2, child: buildButtons(index)),
                                  ],
                                ),
                              ),
                            );
                          })
                    ],
                  ),
                )
              : UpdatePage()),
    );
  }

  DateTime time = DateTime.now();

  List<NotiFicationContent> getNotification() {
    DateTime _yesterday = DateTime(time.year, time.month, time.day - 1);

    List<NotiFicationContent> _notificationContent = [
      NotiFicationContent(name: 'subin_bhandari', type: 'Review', time: time),
      NotiFicationContent(
        name: 'Manish Paudel',
        type: 'New User',
        time: time,
      ),
      NotiFicationContent(
        name: 'Anish',
        type: 'Task',
        time: time,
      ),
      NotiFicationContent(name: 'Manish', type: 'Absent', time: _yesterday),
      NotiFicationContent(
        name: 'Manish',
        type: 'leave',
        time: _yesterday,
      ),
      NotiFicationContent(name: 'Internet Bill', type: 'Pay', time: _yesterday),
      NotiFicationContent(
        name: 'Meat',
        type: 'Stock',
        time: _yesterday,
      ),
      NotiFicationContent(
          name: 'Subin', type: 'Task Complete', time: _yesterday),
    ];
    return _notificationContent;
  }

  buildButtons(int index) {
    if (getNotification()[index].type == 'New User' ||
        getNotification()[index].type == 'Pay') {
      return Container(
          height: MediaQuery.of(context).size.height * 0.045,
          width: MediaQuery.of(context).size.width * 0.25,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: getColor(index)),
          child: Center(
            child: Text(
              getTextForButton(index),
              style: TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.w500,
              ),
            ),
          ));
    }
    return Text('');
  }

  String getTextForButton(int index) {
    if (getNotification()[index].type == 'New User') {
      return 'Follow';
    } else if (getNotification()[index].type == 'Pay') {
      return 'Pay Bill';
    }
    return '';
  }

  Color getColor(int index) {
    if (getNotification()[index].type == 'New User') {
      return Colors.black;
    } else if (getNotification()[index].type == 'Pay') {
      return Colors.green[300];
    }
    return null;
  }

  String buildNotiFicationText(int index) {
    if (getNotification()[index].type == 'Review') {
      return getNotification()[index].name + 'recently reviewed your food';
    } else if (getNotification()[index].type == 'New User') {
      return getNotification()[index].name +
          ',one of your staff is on foodhunter as manish_poudel.Would you like to follow him?';
    } else if (getNotification()[index].type == 'Task') {
      return getNotification()[index].name +
          ',added a new task and assign you and 3 others.';
    } else if (getNotification()[index].type == 'Absent') {
      return getNotification()[index].name +
          ',and 4 other are absent today,Approve their leaves';
    } else if (getNotification()[index].type == 'leave') {
      return getNotification()[index].name +
          ',applied for 3 Day sick leaves.Waiting for your approval.';
    } else if (getNotification()[index].type == 'Pay') {
      return getNotification()[index].name +
          'is due for 3 days.Due date 21 may 2021';
    } else if (getNotification()[index].type == 'Stock') {
      return getNotification()[index].name +
          'and 3 other items are out of stock.Refil your stocks';
    } else if (getNotification()[index].type == 'Task Complete') {
      return getNotification()[index].name +
          'just complet task that you assigned,View task';
    } else
      return '';
  }
}

class NotiFicationContent {
  final String name;

  final String type;
  final DateTime time;

  NotiFicationContent({this.name, this.type, this.time});
}
