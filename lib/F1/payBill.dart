import 'package:flutter/material.dart';
import 'package:manager/F1/billModel.dart';
import 'package:manager/providers.dart/myProviderAct.dart';
import 'package:manager/F1/jsonBillDecode.dart';
import 'package:manager/dateFormat.dart';
import 'package:provider/provider.dart';

class PayBill extends StatefulWidget {
  final BillModel data;
  final String text;
  PayBill({this.data, this.text});

  @override
  _PayBillState createState() => _PayBillState();
}

class _PayBillState extends State<PayBill> {
  void initState() {
    super.initState();
  }

  int afterPaid = 0;
  bool _paid = false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Consumer<MyProvider>(
      builder: (context, paidHistory, _) {
        return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              toolbarHeight: 70,
              centerTitle: true,
              actions: [
                IconButton(
                    color: Colors.black,
                    iconSize: 30,
                    icon: Icon(Icons.note_add),
                    onPressed: () {})
              ],
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    height: height * 0.25,
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            widget.data.title.toString(),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          subtitle: Text(widget.text),
                          leading: Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(5)),
                              height:
                                  MediaQuery.of(context).size.height * 1 / 10,
                              width:
                                  MediaQuery.of(context).size.height * 1 / 18,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Text(
                                      formatDate(widget.data.dateTime)
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
                                      child: Divider(color: Colors.white)),
                                  Expanded(
                                      flex: 4,
                                      child: Text(
                                        widget.data.dateTime.day.toString(),
                                        style: TextStyle(color: Colors.white),
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                        IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 50, right: 20, top: 10, bottom: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            'Total',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            _paid == false
                                                ? 'Rs ' +
                                                    widget.data.ammount
                                                        .toString()
                                                : 'Rs ' + afterPaid.toString(),
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                            ),
                                          )
                                        ],
                                      ),
                                      VerticalDivider(
                                        thickness: 1,
                                        width: 30,
                                        color: Colors.grey[400],
                                        indent: 0,
                                        endIndent: 0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, top: 10, bottom: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        'Paid',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        _paid == true
                                            ? 'Rs ' +
                                                widget.data.ammount.toString()
                                            : 'Rs ' + afterPaid.toString(),
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16),
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
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Container(
                      color: Colors.grey[400].withOpacity(0.5),
                      height: height * 1 / 25,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 20, right: 6, bottom: 5, top: 6),
                        child: Text(
                          'Payment History',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ))
                  ],
                ),
                Expanded(
                  child: Container(
                      width: width,
                      child: SingleChildScrollView(
                        child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: paidHistory.payHistory.length,
                            itemBuilder: (context, index) {
                              return Opacity(
                                opacity: 0.5,
                                child: ListTile(
                                  title: Text(
                                    paidHistory.payHistory[index].title,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  subtitle: Text(
                                    'Paid, ' +
                                        formatDateForPaidHitory(paidHistory
                                            .payHistory[index].paidDate),
                                  ),
                                  leading: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5, bottom: 5),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              1 /
                                              10,
                                      width:
                                          MediaQuery.of(context).size.height *
                                              1 /
                                              18,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            flex: 4,
                                            child: Text(
                                              formatDate(paidHistory
                                                      .payHistory[index]
                                                      .createdDate)
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
                                                paidHistory.payHistory[index]
                                                    .createdDate.day
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                  trailing: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        'Rs ' +
                                            paidHistory
                                                .payHistory[index].ammount
                                                .toString(),
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        paidHistory.payHistory[index].category,
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                      )),
                )
              ],
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: _paid == false
                ? GestureDetector(
                    onTap: () async {
                      setState(() {
                        _paid = true;
                      });
                      PayMentHistory history = PayMentHistory(
                          createdDate: widget.data.dateTime,
                          title: widget.data.title,
                          ammount: widget.data.ammount,
                          paidDate: DateTime.now(),
                          category: widget.data.category);
                      await Provider.of<MyProvider>(context, listen: false)
                          .addToPaidHistoryList(history);

                      print(widget.data.paid.toString());
                    },
                    child: buidldContaier())
                : buidldContaier());
      },
    );
  }

  buidldContaier() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            width: _paid ? 3 : 0,
            color: Colors.green[500],
          ),
          color: _paid == false ? Colors.green[500] : Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: _paid == false
          ? Center(
              child: Text(
                'Pay Bill',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            )
          : Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.check,
                    color: Colors.green,
                  ),
                  Text(
                    'Paid',
                    style: TextStyle(
                        color: Colors.green[500],
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
      height: MediaQuery.of(context).size.height * 1 / 18,
      width: MediaQuery.of(context).size.width * 0.6,
    );
  }
}
