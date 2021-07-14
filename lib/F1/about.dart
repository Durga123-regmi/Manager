import 'package:flutter/material.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'About',
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.w600, fontSize: 41),
      ),
    );
  }
}
