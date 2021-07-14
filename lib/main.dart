import 'package:flutter/material.dart';
import 'package:manager/providers.dart/myProviderAct.dart';
import 'package:manager/F1/chartPageForIncExp.dart';
import 'package:manager/F1/homePage.dart';
import 'package:provider/provider.dart';

import 'F1/bill.dart';
import 'F1/notification.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MyProvider>(create: (context) {
          return MyProvider();
        })
      ],
      child: MaterialApp(
          initialRoute: '/home',
          routes: {
            '/home': (context) => HomePage(),
            '/notification': (context) => NotificationClass(),
          },
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Bill()),
    );
  }
}
