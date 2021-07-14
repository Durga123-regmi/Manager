import 'package:flutter/material.dart';
import 'package:manager/providers.dart/myProviderAct.dart';
import 'package:manager/F1/overView.dart';
import 'package:manager/F1/pageViewWidgetPage.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'listItems.dart';
import 'menuDetails.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: ListTile(
              subtitle: Text(
                '24 Categories',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    color: Colors.black.withOpacity(0.5)),
              ),
              title: Text(
                'Category',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              trailing: buildExpandedIcon(height),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            child: Hero(
                tag: 'menu',
                child:
                    Container(height: height * 0.30, child: PageviewWidget())),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Divider(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            child: ListTile(
              title: Text(
                'Types',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                ),
              ),
              subtitle: Text(
                '7 Diffrent types of menu',
                style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontWeight: FontWeight.w400,
                    fontSize: 13),
              ),
            ),
          ),
          Container(
            height: height * 0.4,
            width: width,
            child: SingleChildScrollView(
              child: Center(
                child: Wrap(
                  children: [
                    for (var menu in menuType)
                      GestureDetector(
                        child:
                            buildMenuTypeWidget(height, width, menu, context),
                        onTap: () async {
                          await Provider.of<MyProvider>(context, listen: false)
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
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 20,
              bottom: 15,
            ),
            child: Divider(),
          ),
          Center(
            child: Container(
              height: height * 0.07,
              width: width * 0.45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[400]),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SizedBox(
                        height: height * 0.035,
                        width: height * 0.035,
                        child: Image.asset(
                          'asset/alternate.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Mangae Menu',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            'Edit,Add,Delete Menu',
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontWeight: FontWeight.w400,
                              fontSize: 11,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15, right: 15, top: 30),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Note',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, left: 15, right: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildNoteheaderHere(
                    "Menu prices should be same as restaurant's"),
                buildNoteheaderHere(
                    "Menu prices should be same as restaurant's"),
                buildNoteheaderHere(
                    "Menu prices should be same as restaurant's"),
                buildNoteheaderHere(
                    "Menu prices should be same as restaurant's"),
                buildNoteheaderHere(
                    "Menu prices should be same as restaurant's"),
                buildNoteheaderHere(
                    "Menu prices should be same as restaurant's"),
                buildNoteheaderHere(
                    "Menu prices should be same as restaurant's"),
                buildNoteheaderHere(
                    "Menu prices should be same as restaurant's")
              ],
            ),
          )
        ],
      ),
    );
  }

  buildNoteheaderHere(String s) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.01,
            width: MediaQuery.of(context).size.height * 0.01,
            decoration: BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            s,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w400, fontSize: 12),
          )
        ],
      ),
    );
  }
}

buildMenuTypeWidget(double height, double width, MenuTypes menu, context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration(
          color: Colors.grey[400], borderRadius: BorderRadius.circular(5)),
      height: height * 0.07,
      constraints: BoxConstraints(maxWidth: width * 0.45),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            SizedBox(
              height: height * 0.035,
              width: height * 0.035,
              child: Image.asset(
                menu.url,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    menu.type,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                ),
                Expanded(
                  child: Text(
                    menu.noOfItems.toString() + " items",
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontWeight: FontWeight.w400,
                        fontSize: 11),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ),
  );
}
