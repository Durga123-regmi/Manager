import 'package:flutter/material.dart';
import 'listItems.dart';

class PageviewWidget extends StatefulWidget {
  @override
  _PageviewWidgetState createState() => _PageviewWidgetState();
}

class _PageviewWidgetState extends State<PageviewWidget> {
  int changedheightPage = 0;
  int initialIndex = 1;
  PageController _pagecontroller;

  void initState() {
    super.initState();
    _pagecontroller =
        PageController(viewportFraction: 0.28, initialPage: initialIndex);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return PageView.builder(
        reverse: false,
        onPageChanged: (i) {
          print(i);

          setState(() {
            changedheightPage = i - 1;
          });
        },
        controller: _pagecontroller,
        itemCount: menuItems.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Center(
            child: AnimatedPadding(
              duration: Duration(milliseconds: 200),
              curve: Curves.easeIn,
              padding: index == changedheightPage
                  ? EdgeInsets.only(
                      left: 10, right: 10, top: 20, bottom: height * 0.04)
                  : EdgeInsets.only(
                      left: 10, right: 10, top: 20, bottom: height * 0.09),
              child: Center(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: PhysicalModel(
                          color: Colors.white,
                          elevation: 20,
                          borderRadius: BorderRadius.circular(15),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: index == changedheightPage
                                  ? EdgeInsets.only(bottom: height * 0.02)
                                  : EdgeInsets.only(bottom: 0),
                              child: Container(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Text(
                                            menuItems[index].type,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 15),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          menuItems[index]
                                                  .totalItems
                                                  .toString() +
                                              ' items',
                                          style: TextStyle(
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                height: height * 0.07,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                            ),
                          )),
                    ),
                    Align(
                        alignment: Alignment.topCenter,
                        child: PhysicalModel(
                          elevation: index == changedheightPage ? 20 : 0,
                          shape: BoxShape.circle,
                          color: Colors.white,
                          shadowColor: Colors.black,
                          child: AnimatedContainer(
                            curve: Curves.easeIn,
                            duration: Duration(milliseconds: 300),
                            height: index == changedheightPage
                                ? height * 0.125
                                : height * 0.12,
                            width: index == changedheightPage
                                ? height * 0.125
                                : height * 0.12,
                            decoration: BoxDecoration(shape: BoxShape.circle),
                            child: Image.asset(
                              menuItems[index].iamgeUrl,
                              fit: BoxFit.fill,
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
