import 'package:flutter/material.dart';

class AnalyticalWidget extends StatefulWidget {
  @override
  _AnalyticalWidgetState createState() => _AnalyticalWidgetState();
}

class _AnalyticalWidgetState extends State<AnalyticalWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Analytics',
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.w600, fontSize: 60),
      ),
    );
    ;
  }
}
