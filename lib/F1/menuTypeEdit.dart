import 'package:flutter/material.dart';
import 'package:manager/F1/listItems.dart';
import 'package:manager/F1/menu.dart';
import 'package:manager/F1/menuDetails.dart';
import 'package:manager/providers.dart/myProviderAct.dart';
import 'package:manager/tabView.dart/quickAction.dart';
import 'package:provider/provider.dart';

class MenuTypeEdit extends StatefulWidget {
  @override
  _MenuTypeEditState createState() => _MenuTypeEditState();
}

class _MenuTypeEditState extends State<MenuTypeEdit> {
  int tab = 1;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: height * .93,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Container(
                height: height * 0.01,
                width: width * 0.2,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 20,
                bottom: 20,
              ),
              child: Text(
                'FoodBank Restro',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 19,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Container(
                        height: height * 0.06,
                        decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius: BorderRadius.circular(15)),
                        child: buildChildContainerTab('Quick Action', 1),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Container(
                        child: Row(
                          children: [
                            Expanded(
                                child: buildChildContainerTab('Dine In', 2)),
                            Expanded(
                              child: buildChildContainerTab('Delivery', 3),
                            ),
                            Expanded(
                              child: buildChildContainerTab('Take Away', 4),
                            )
                          ],
                        ),
                        height: height * 0.06,
                        width: width * 0.3,
                        decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                  )
                ],
              ),
            ),
            tab == 1 ? QuickAction() : Text('hello')
          ],
        ),
      ),
    );
  }

  buildChildContainerTab(String s, int t) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: PhysicalModel(
        borderRadius: BorderRadius.circular(15),
        color: tab == t ? Colors.white : Colors.grey[400],
        shadowColor: Colors.black,
        elevation: tab == t ? 20 : 0,
        child: GestureDetector(
          onTap: () {
            setState(() {
              tab = t;
            });
          },
          child: Container(
            height: MediaQuery.of(context).size.height * 0.055,
            child: Center(
              child: Text(
                s.toString(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            decoration: BoxDecoration(
                color: tab == t ? Colors.white : Colors.grey[400],
                borderRadius: BorderRadius.circular(15)),
          ),
        ),
      ),
    );
  }
}
