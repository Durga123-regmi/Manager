import 'package:flutter/material.dart';
import 'package:manager/F1/staffWidget.dart';
import 'package:manager/main.dart';

import 'AccountWidget.dart';
import 'AnalyticsWIdget.dart';
import 'homeWidget.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:waiter/Services/wallet.dart';
// import 'package:waiter/Tasks/homePage.dart';
// import 'package:waiter/Services/dashBoard.dart';
// import 'package:waiter/pages/taskAndNotes.dart';
// import 'homeScreen.dart';
// import '../Services/message.dart';
// import '../Services/myHome.dart';
// import '../Services/settings.dart';

// class Myapp extends StatefulWidget {
//   int currentIndex;

//   Myapp({this.currentIndex});

//   @override
//   _MyappState createState() => _MyappState();
// }

// //  int _currentIndex;
// var index;
// final List<Widget> _children = [
//   AnalyticalWidget(),
//   AccountWidget(),
//   HomeWidget(),
//   StaffWidget(),

//   // DashBoard(),
//   // HomeScreen(),
//   // // HomePageNotes(),
//   // TaskAndNotes(),
//   // // MyHome(),
//   // WalletMiddlePage(),
//   // Settings(),
// ];

// List<Color> _colors = [
//   Colors.red[300],
//   Colors.green,
//   Colors.purple,
//   Colors.black,
//   Colors.blue
// ];

// @override
// class _MyappState extends State<Myapp> {
//   double xOffset = 0;
//   double yOffset = 0;
//   double scaleFactor = 1;
//   bool isDrawerOpen = false;
//   var currentIndex;
//   Color bichKo;
//   bool isStacked;
//   bool isRecep = true;

//   void initState() {
//     super.initState();
//     // getButtonColors();
//     // print(index);
//     // getColor();
//     isStacked = false;
//     // widget.indexo = 0;

//     // print(_colors[getButtonColors()]);
//   }

//   // ignore: non_constant_identifier_names
//   // void didUpdateWidget(Myapp) {
//   //   super.didUpdateWidget(Myapp);
//   //   // getButtonColors();
//   //   // print(index);
//   //   // getColor();
//   // }

//   // getButtonColors() async {
//   //   SharedPreferences prefs = await SharedPreferences.getInstance();
//   //   setState(() {
//   //     index = prefs.getInt('colors');
//   //   });
//   // }

//   // getColor() async {
//   //   SharedPreferences prefs = await SharedPreferences.getInstance();
//   //   bichKo = (prefs.getInt("selectColor") == null)
//   //       ? Color(0xffe57373)
//   //       : Color(prefs.getInt("selectColor"));
//   //   print(prefs.getInt("selectColor"));
//   // }

//   @override
//   Widget build(BuildContext context) {
//     final Size size = MediaQuery.of(context).size;
//     // display() {
//     //   if (index != null) {
//     //     return index;
//     //   } else
//     //     return Colors.red[300];
//     // }

//     return AnimatedContainer(
//       transform: Matrix4.translationValues(xOffset, yOffset, 0)
//         ..scale(scaleFactor)
//         ..rotateY(isDrawerOpen ? -0.5 : 0),
//       duration: Duration(milliseconds: 250),
//       // decoration: BoxDecoration(
//       //   borderRadius: BorderRadius.only(
//       //       bottomLeft: Radius.circular(40), topLeft: Radius.circular(40)),
//       //   border: Border.all(color: Colors.red[500], width: 3),
//       // ),
//       child: ClipRRect(
//         borderRadius:
//             isStacked ? BorderRadius.circular(40) : BorderRadius.circular(0),
//         child: Stack(children: [
//           Scaffold(
//             // backgroundColor: Colors.teal,
//             appBar: widget.currentIndex == 0
//                 ? AppBar(
//                     title: Align(
//                         alignment: Alignment.topRight,
//                         child: IconButton(
//                             icon: Icon(Icons.notifications),
//                             onPressed: () {
//                               Navigator.pushNamed(context, '/notification');
//                             })),
//                     backgroundColor: Colors.transparent,
//                     bottomOpacity: 0.0,
//                     elevation: 0.0,
//                     iconTheme:
//                         Theme.of(context).brightness.toString().toLowerCase() ==
//                                 'brightness.dark'
//                             ? IconThemeData(color: Colors.white)
//                             : IconThemeData(color: Colors.black),
//                     // iconTheme: IconThemeData(color: Colors.black),
//                     leading: isDrawerOpen
//                         ? InkWell(
//                             onTap: () {
//                               setState(() {
//                                 xOffset = 0;
//                                 yOffset = 0;
//                                 scaleFactor = 1;

//                                 isDrawerOpen = false;
//                                 isStacked = false;
//                               });
//                               _showOverlay(context);
//                             },
//                             child: Icon(Icons.arrow_back))
//                         : InkWell(
//                             onTap: () {
//                               setState(() {
//                                 xOffset = 300;
//                                 yOffset = 115;
//                                 scaleFactor = 0.75;

//                                 isDrawerOpen = true;
//                                 isStacked = true;
//                               });
//                             },
//                             child: Icon(Icons.menu)))
//                 : widget.currentIndex == 1
//                     ? AppBar(
//                         title: Align(
//                             alignment: Alignment.topRight,
//                             child: Icon(Icons.notifications)),
//                         backgroundColor: Colors.transparent,
//                         bottomOpacity: 0.0,
//                         elevation: 0.0,
//                         iconTheme: Theme.of(context)
//                                     .brightness
//                                     .toString()
//                                     .toLowerCase() ==
//                                 'brightness.dark'
//                             ? IconThemeData(color: Colors.white)
//                             : IconThemeData(color: Colors.black),
//                         // iconTheme: IconThemeData(color: Colors.black),
//                         leading: isDrawerOpen
//                             ? InkWell(
//                                 onTap: () {
//                                   setState(() {
//                                     xOffset = 0;
//                                     yOffset = 0;
//                                     scaleFactor = 1;

//                                     isDrawerOpen = false;
//                                     isStacked = false;
//                                   });
//                                   _showOverlay(context);
//                                 },
//                                 child: Icon(Icons.arrow_back))
//                             : InkWell(
//                                 onTap: () {
//                                   setState(() {
//                                     xOffset = 300;
//                                     yOffset = 115;
//                                     scaleFactor = 0.75;

//                                     isDrawerOpen = true;
//                                     isStacked = true;
//                                   });
//                                 },
//                                 child: Icon(Icons.menu)))
//                     : widget.currentIndex == 2
//                         ? AppBar(
//                             title: Text(
//                               "Task And Notes",
//                               style: Theme.of(context)
//                                           .brightness
//                                           .toString()
//                                           .toLowerCase() ==
//                                       'brightness.dark'
//                                   ? TextStyle(color: Colors.white)
//                                   : TextStyle(color: Colors.black),
//                             ),
//                             iconTheme: Theme.of(context)
//                                         .brightness
//                                         .toString()
//                                         .toLowerCase() ==
//                                     'brightness.dark'
//                                 ? IconThemeData(color: Colors.white)
//                                 : IconThemeData(color: Colors.black),
//                             backgroundColor: Colors.transparent,
//                             bottomOpacity: 0.0,
//                             elevation: 0.0,
//                             // iconTheme: IconThemeData(color: Colors.black),
//                             leading: isDrawerOpen
//                                 ? InkWell(
//                                     onTap: () {
//                                       setState(() {
//                                         xOffset = 0;
//                                         yOffset = 0;
//                                         scaleFactor = 1;

//                                         isDrawerOpen = false;
//                                         isStacked = false;
//                                       });
//                                     },
//                                     child: Icon(Icons.arrow_back))
//                                 : InkWell(
//                                     onTap: () {
//                                       setState(() {
//                                         xOffset = 300;
//                                         yOffset = 115;
//                                         scaleFactor = 0.75;

//                                         isDrawerOpen = true;
//                                         isStacked = true;
//                                       });
//                                     },
//                                     child: Icon(Icons.menu)),
//                             centerTitle: true,
//                           )
//                         : widget.currentIndex == 3
//                             ? AppBar(
//                                 title: Text(
//                                   "Wallets",
//                                   style: Theme.of(context)
//                                               .brightness
//                                               .toString()
//                                               .toLowerCase() ==
//                                           'brightness.dark'
//                                       ? TextStyle(color: Colors.white)
//                                       : TextStyle(color: Colors.black),
//                                 ),
//                                 iconTheme: Theme.of(context)
//                                             .brightness
//                                             .toString()
//                                             .toLowerCase() ==
//                                         'brightness.dark'
//                                     ? IconThemeData(color: Colors.white)
//                                     : IconThemeData(color: Colors.black),
//                                 backgroundColor: Colors.transparent,
//                                 bottomOpacity: 0.0,
//                                 elevation: 0.0,
//                                 // iconTheme: IconThemeData(color: Colors.black),
//                                 leading: isDrawerOpen
//                                     ? InkWell(
//                                         onTap: () {
//                                           setState(() {
//                                             xOffset = 0;
//                                             yOffset = 0;
//                                             scaleFactor = 1;

//                                             isDrawerOpen = false;
//                                             isStacked = false;
//                                           });
//                                         },
//                                         child: Icon(Icons.arrow_back))
//                                     : InkWell(
//                                         onTap: () {
//                                           setState(() {
//                                             xOffset = 300;
//                                             yOffset = 115;
//                                             scaleFactor = 0.75;

//                                             isDrawerOpen = true;
//                                             isStacked = true;
//                                           });
//                                         },
//                                         child: Icon(Icons.menu)),
//                                 centerTitle: true,
//                               )
//                             : AppBar(),
//             body: _children[widget.currentIndex],
//             // bottomNavigationBar: ButtonTabNavBar(),
//           ),
//           Positioned(
//             height: 60,
//             bottom: 10,
//             width: size.width - 20,
//             left: 10,
//             // left: size.width / 20,
//             child: Align(
//               alignment: Alignment.center,
//               child: Stack(
//                 children: [
//                   CustomPaint(
//                     size: Size(size.width, 60),
//                     painter: BNBCustomPainter(),
//                   ),
//                   Center(
//                     heightFactor: 0.15,
//                     child: FloatingActionButton(
//                       heroTag: "btn2",
//                       onPressed: isRecep == true
//                           ? () {
//                               Navigator.pushNamed(context, '/addReceptions');
//                             }
//                           : () {
//                               Navigator.pushNamed(context, '/qrScan');
//                             },
//                       backgroundColor: bichKo,
//                       child: isRecep == true
//                           ? Icon(Icons.home)
//                           : widget.currentIndex == 3
//                               ? Icon(Icons.add_rounded)
//                               : Icon(
//                                   Icons.scanner,
//                                   size: 40,
//                                 ),
//                       elevation: 0.1,
//                     ),
//                   ),
//                   Container(
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Material(
//                           color: Colors.transparent,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               IconButton(
//                                 icon: Icon(Icons.home),
//                                 onPressed: () {
//                                   setState(() {
//                                     widget.currentIndex = 0;
//                                   });
//                                 },
//                                 color: widget.currentIndex == 0
//                                     ? bichKo
//                                     : Colors.black,
//                               ),
//                               Text('Analytics')
//                             ],
//                           ),
//                         ),
//                         Material(
//                           color: Colors.transparent,
//                           child: Column(
//                             children: [
//                               IconButton(
//                                 icon: Icon(Icons.work),
//                                 onPressed: () {
//                                   setState(() {
//                                     widget.currentIndex = 1;
//                                   });
//                                 },
//                                 color: widget.currentIndex == 1
//                                     ? bichKo
//                                     : Colors.black,
//                               ),
//                             ],
//                           ),
//                         ),
//                         Container(width: size.width * 0.10),
//                         Material(
//                           color: Colors.transparent,
//                           child: IconButton(
//                             icon: Icon(Icons.table_view),
//                             onPressed: () {
//                               setState(() {
//                                 widget.currentIndex = 2;
//                               });
//                             },
//                             color: widget.currentIndex == 2
//                                 ? bichKo
//                                 : Colors.black,
//                           ),
//                         ),
//                         Material(
//                           color: Colors.transparent,
//                           child: IconButton(
//                             icon: Icon(Icons.account_balance_wallet),
//                             onPressed: () {
//                               // getColor();
//                               setState(() {
//                                 widget.currentIndex = 3;
//                               });
//                             },
//                             color: widget.currentIndex == 3
//                                 ? bichKo
//                                 : Colors.black,
//                           ),
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           )
//         ]),
//       ),
//     );
//   }
// }

// _showOverlay(BuildContext context) {}

// class ButtonTabNavBar extends StatefulWidget {
//   @override
//   _ButtonTabNavBarState createState() => _ButtonTabNavBarState();
// }

// class _ButtonTabNavBarState extends State<ButtonTabNavBar> {
//   int _currentIndex = 0;
//   final List<Widget> _children = [];
//   @override
//   Widget build(BuildContext context) {
//     final Size size = MediaQuery.of(context).size;

//     return (Positioned(
//       height: 60,
//       bottom: 0,
//       width: size.width - 20,
//       left: 10,
//       // left: size.width / 20,
//       child: Align(
//         alignment: Alignment.center,
//         child: Stack(
//           children: [
//             CustomPaint(
//               size: Size(size.width, 60),
//               painter: BNBCustomPainter(),
//             ),
//             Center(
//               heightFactor: 0.15,
//               child: FloatingActionButton(
//                 onPressed: () {},
//                 backgroundColor: Colors.red[300],
//                 child: Icon(
//                   Icons.add_rounded,
//                   size: 40,
//                 ),
//                 elevation: 0.1,
//               ),
//             ),
//             Container(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   IconButton(
//                     icon: Icon(Icons.home),
//                     onPressed: () {
//                       // if (widget.index != 1) {
//                       //   Navigator.pushNamed(context, '/waiter');
//                       // }
//                     },
//                     // color: widget.index == 1 ? Colors.blue : Colors.black,
//                   ),
//                   IconButton(
//                     icon: Icon(Icons.message),
//                     onPressed: () {
//                       // if (widget.index != 2) {
//                       //   Navigator.pushNamed(context, '/message');
//                       // }
//                     },
//                     // color: widget.index == 2 ? Colors.blue : Colors.black,
//                   ),
//                   Container(width: size.width * 0.10),
//                   IconButton(
//                     icon: Icon(Icons.people),
//                     onPressed: () {
//                       // if (widget.index != 3) {
//                       //   Navigator.pushNamed(context, '/myHome');
//                       // }
//                     },
//                     // color: widget.index == 3 ? Colors.blue : Colors.black,
//                   ),
//                   IconButton(
//                     icon: Icon(Icons.settings),
//                     onPressed: () {
//                       // if (widget.index != 4) {
//                       //   Navigator.pushNamed(context, '/setting');
//                       // }
//                     },
//                     // color: widget.index == 4 ? Colors.blue : Colors.black,
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     ));
//   }
// }

// class BNBCustomPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()
//       ..color = Colors.grey[300]
//       ..style = PaintingStyle.fill;

//     Path path = Path()..moveTo(size.width * 0.1, 0);
//     path.quadraticBezierTo(size.width * 0.05, 0, size.width * 0.35, 0);
//     path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.41, 5);
//     path.arcToPoint(Offset(size.width * 0.59, 5),
//         radius: Radius.circular(7), clockwise: false);
//     path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
//     path.quadraticBezierTo(size.width * 0.65, 0, size.width * 0.9, 0);
//     path.quadraticBezierTo(size.width, 0, size.width, size.height / 2);
//     path.quadraticBezierTo(
//         size.width, size.height, size.width * 0.9, size.height);

//     path.quadraticBezierTo(
//         size.width * 0.9, size.height, size.width * 0.1, size.height);

//     path.quadraticBezierTo(0, size.height, 0, size.height / 2);
//     path.quadraticBezierTo(0, 0, size.width * 0.1, 0);

//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }

import 'package:flutter/material.dart';
import 'package:manager/F1/AccountWidget.dart';
import 'package:manager/F1/AnalyticsWIdget.dart';
import 'package:manager/F1/homeWidget.dart';
import 'package:manager/F1/messagePage.dart';
import 'package:manager/providers.dart/myProviderAct.dart';
import 'package:manager/F1/notification.dart';
import 'package:manager/F1/profilePage.dart';
import 'package:manager/F1/staffWidget.dart';
import 'package:provider/provider.dart';

import 'menuTypeEdit.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 2;

  void initState() {
    super.initState();
    setIndex();
    print(DateTime.now().toString());
  }

  setIndex() {
    setState(() {
      _currentIndex = 2;
    });
  }

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Consumer<MyProvider>(
      builder: (BuildContext context, restros, _) {
        return SafeArea(
          child: Scaffold(
            key: _scaffoldKey,
            drawer: Drawer(),
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 10, bottom: 10),
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      _scaffoldKey.currentState.openDrawer();
                    },
                    child: Container(
                      child: Image.asset(
                        'asset/menu.png',
                        fit: BoxFit.fill,
                      ),
                      height: height * 1 / 35,
                      width: height * height * 1 / 35,
                    ),
                  ),
                ),
              ),
              actions: [
                IconButton(
                    iconSize: 25,
                    icon: Icon(
                      Icons.notifications,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return NotificationClass();
                      }));
                    }),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: IconButton(
                      icon: Icon(
                        Icons.messenger,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return MessagePage();
                        }));
                      }),
                )
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.grey[400],
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.black,
              elevation: 0,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.analytics), label: 'Analytics'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.badge), label: 'Accounts'),
                BottomNavigationBarItem(
                    icon: GestureDetector(
                      onLongPress: () {
                        showEditMenuTypeSheet();
                      },
                      child: Icon(
                        Icons.home,
                        size: 40,
                      ),
                    ),
                    label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: 'Staffs'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.food_bank), label: 'Profile'),
              ],
              currentIndex: _currentIndex,
              type: BottomNavigationBarType.fixed,
              onTap: (int index) {
                if (index == 4) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ProfilePage();
                  }));
                }
                setState(() {
                  this._currentIndex = index;
                });
              },
            ),
            body: _pages[_currentIndex],
          ),
        );
      },
    );
  }

  List _pages = <Widget>[
    AnalyticalWidget(),
    AccountWidget(),
    HomeWidget(),
    StaffWidget(),
    Text(''),
  ];

  void showEditMenuTypeSheet() {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25))),
        context: context,
        builder: (ctx) {
          return MenuTypeEdit();
        });
  }
}
