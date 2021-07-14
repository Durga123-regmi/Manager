import 'package:flutter/material.dart';
import 'package:manager/F1/pieChartPage.dart';

class IncomeExpensesDetailPage extends StatefulWidget {
  final IncomeExpDetailPie detail;
  IncomeExpensesDetailPage(this.detail);

  @override
  _IncomeExpensesDetailPageState createState() =>
      _IncomeExpensesDetailPageState();
}

class _IncomeExpensesDetailPageState extends State<IncomeExpensesDetailPage> {
  buildListOfPage() {
    return BuildListWithHeading(
      detail: widget.detail,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          widget.detail.category.toString(),
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView(
        children: [
          buildListOfPage(),
          buildListOfPage(),
          buildListOfPage(),
        ],
      ),
    );
  }
}

class BuildListWithHeading extends StatelessWidget {
  final IncomeExpDetailPie detail;
  BuildListWithHeading({this.detail});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.red,
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Asset',
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '2.2%',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Rs 250050.00',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                )
              ],
            ),
            subtitle: Text(
              detail.category.toString(),
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8),
          child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (ctx, index) {
                return ListTile(
                  onTap: () {},
                  trailing: Text(
                    'Rs 10,000',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),
                  subtitle: Text(
                    'Mon,May 24,2021',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 11,
                        fontWeight: FontWeight.w400),
                  ),
                  title: Text(
                    'Cooking Station',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                  ),
                );
              }),
        )
      ],
    );
  }
}
