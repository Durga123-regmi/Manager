import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:manager/F1/pieChartPage.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AnimatedIncExp extends StatefulWidget {
  final Color color;
  final String text1;
  final Function fn;

  AnimatedIncExp({this.color, this.text1, this.fn});

  @override
  _AnimatedIncExpState createState() => _AnimatedIncExpState();
}

class _AnimatedIncExpState extends State<AnimatedIncExp>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _curveAnimation;
  Animation<double> _rotateAnimation;

  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    _curveAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _rotateAnimation =
        Tween<double>(begin: 0.0, end: math.pi * 2).animate(_curveAnimation);

    _controller.addListener(() {
      setState(() {});
    });

    _controller.repeat();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (ctx) {
          return PieChartPage(s: widget.text1);
        }));
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: widget.text1 == 'e'
                  ? Image.asset(
                      'asset/hd.png',
                      fit: BoxFit.fill,
                    )
                  : Center(
                      child: Image.asset(
                        'asset/inclogo.png',
                        fit: BoxFit.fill,
                      ),
                    ),
            ),
          ),
          SubContainer(height)
        ],
      ),
    );
  }
}

class SubContainer extends StatelessWidget {
  final double height;
  SubContainer(this.height);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(
        Icons.arrow_forward_ios,
        color: Colors.black,
      ),
    );
  }
}
