import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:manager/F1/chooseRestaurant.dart';
import 'package:manager/F1/listItems.dart';
import 'package:manager/F1/menu.dart';
import 'package:manager/F1/messagePage.dart';
import 'package:manager/providers.dart/myProviderAct.dart';
import 'package:provider/provider.dart';

class ChooseMenuFromBottomSheet extends StatefulWidget {
  @override
  _ChooseMenuFromBottomSheetState createState() =>
      _ChooseMenuFromBottomSheetState();
}

class _ChooseMenuFromBottomSheetState extends State<ChooseMenuFromBottomSheet> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Consumer<MyProvider>(
      builder: (context, restro, _) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 0.8, sigmaY: 0.8),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                  padding: const EdgeInsets.only(top: 15),
                  child: ListTile(
                    subtitle: Text(
                      '3 Messages and 2 More',
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                    title: Text(
                      restro.initialRestaurant.name,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey[400],
                      child: Center(
                        child: Image.asset(
                          restro.initialRestaurant.imagePath,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.arrow_drop_down_circle,
                        size: 26,
                      ),
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    topRight: Radius.circular(25))),
                            builder: (ctx) {
                              return ChooseRestaurant(val: 0.45);
                            });
                      },
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: Text(
                    'Digital Menu',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: Colors.black),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Divider(
                    color: Colors.grey[400],
                  ),
                ),
                ListTile(
                  title: Text(
                    'Types',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 17),
                  ),
                  subtitle: Text(
                    '${menuType.length} Diffrent Type Of Menu',
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 13,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: ListView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        Wrap(
                          children: [
                            for (var menu in menuType)
                              GestureDetector(
                                child: buildMenuTypeWidget(
                                    height, width, menu, context),
                                onTap: () async {
                                  await Provider.of<MyProvider>(context,
                                          listen: false)
                                      .changeMenuType(menu);

                                  Navigator.pop(context);
                                },
                              )
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
