import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:manager/F1/restaurantsModel.dart';
import 'package:provider/provider.dart';

import '../providers.dart/myProviderAct.dart';

class ChooseRestaurant extends StatefulWidget {
  double val;
  ChooseRestaurant({this.val});
  @override
  ChooseRestaurantState createState() => ChooseRestaurantState();
}

class ChooseRestaurantState extends State<ChooseRestaurant> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Consumer<MyProvider>(
      builder: (context, restro, _) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 0.8, sigmaY: 0.8),
          child: Container(
            height: widget.val == 0.45 ? height * 0.475 : height * 0.55,
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
                  padding: const EdgeInsets.only(top: 25),
                  child: ListTile(
                    subtitle: Text(
                      '@owner',
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                    title: Text(
                      'Swadesh Nepali',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                    leading: CircleAvatar(
                      child: Image.asset(restro.initialRestaurant.imagePath),
                      radius: 30,
                      backgroundColor: Colors.grey[400],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: Text(
                    'Switch Restaurant',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: Colors.black),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 15),
                  child: Divider(
                    color: Colors.grey[400],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: restro.restaurants.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            trailing: Container(
                              height: height * 0.03,
                              width: height * 0.03,
                              decoration: BoxDecoration(shape: BoxShape.circle),
                              child: restro.restaurants[index].isSelected
                                  ? Image.asset(
                                      'asset/check.png',
                                      fit: BoxFit.fill,
                                    )
                                  : Text(''),
                            ),
                            onTap: () async {
                              setState(() {
                                restro.restaurants.forEach((element) {
                                  setState(() {
                                    element.isSelected = false;
                                  });
                                });
                              });
                              setState(() {
                                restro.restaurants[index].isSelected = true;
                              });

                              await Provider.of<MyProvider>(context,
                                      listen: false)
                                  .changeRestaurantName(
                                      restro.restaurants[index]);
                            },
                            subtitle: Text(
                              '@owner',
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),
                            ),
                            title: Text(
                              restro.restaurants[index].name,
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
                                  restro.restaurants[index].imagePath,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          );
                        }),
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
