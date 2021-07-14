import 'package:flutter/material.dart';
import 'package:manager/F1/billModel.dart';
import 'package:manager/F1/jsonBillDecode.dart';
import 'package:manager/F1/payBill.dart';
import 'package:manager/F1/showBillWithCalendar.dart';
import 'package:manager/dateFormat.dart';

class Bill extends StatefulWidget {
  @override
  _BillState createState() => _BillState();
}

class _BillState extends State<Bill> {
  String text = 'Due in 7 days';
  void initState() {
    super.initState();
    getmodelBillList();

    print(DateTime.now().toString());
  }

  DateTime now = new DateTime.now();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        actions: [
          Padding(
            padding:
                const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Container(
                      height: height * 1 / 30,
                      width: height * 1 / 30,
                      child: Center(
                          child: IconButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (ctx) {
                            return ShowBillWithCalendar();
                          }));
                        },
                        icon: Icon(
                          Icons.calendar_today,
                          size: 20,
                        ),
                        color: Colors.black,
                      ))),
                ),
                SizedBox(
                  width: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Container(
                    height: height * 1 / 30,
                    width: height * 1 / 30,
                    child: Center(
                        child: Icon(
                      Icons.add,
                      color: Colors.black,
                      size: 30,
                    )),
                  ),
                ),
              ],
            ),
          )
        ],
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        centerTitle: true,
        title: Text(
          'Bills',
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Center(
                          child: Text(
                            'Overdue',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Text(
                          'Rs',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        ),
                      )
                    ],
                  ),
                  height: height * 1 / 25,
                  color: Colors.grey[400].withOpacity(0.5),
                ))
              ],
            ),
            Container(
              width: width,
              child: FutureBuilder<List<BillModel>>(
                  future: getmodelBillList(),
                  builder: (context, snapshot) {
                    if (snapshot.data == null) {
                      return CircularProgressIndicator();
                    }
                    {
                      return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: snapshot.data.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return buildContainerForBillData(snapshot, index);
                          });
                    }
                  }),
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Center(
                          child: Text(
                            'Due Withing 30 Days',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Text(
                          'Rs',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        ),
                      )
                    ],
                  ),
                  height: height * 1 / 25,
                  color: Colors.grey[400].withOpacity(0.5),
                ))
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildContainerForBillData(
      AsyncSnapshot<List<BillModel>> snapshot, int index) {
    return ListTile(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (ctx) {
          return PayBill(
            data: snapshot.data[index],
            text: text,
          );
        }));
      },
      leading: Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 5),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(5)),
          height: MediaQuery.of(context).size.height * 1 / 10,
          width: MediaQuery.of(context).size.height * 1 / 18,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 4,
                child: Text(
                  formatDate(snapshot.data[index].dateTime).toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Expanded(flex: 1, child: Divider(color: Colors.white)),
              Expanded(
                  flex: 4,
                  child: Text(
                    snapshot.data[index].dateTime.day.toString(),
                    style: TextStyle(color: Colors.white),
                  )),
            ],
          ),
        ),
      ),
      title: Text(
        snapshot.data[index].title.toString(),
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
            'Rs ' + snapshot.data[index].ammount.toString(),
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
          Text(
            snapshot.data[index].category.toString(),
            style: TextStyle(
                color: Colors.black.withOpacity(0.5),
                fontSize: 10,
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
