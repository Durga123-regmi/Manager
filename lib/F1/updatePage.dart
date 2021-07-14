import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:manager/F1/listItems.dart';

class UpdatePage extends StatefulWidget {
  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  String firstHalfText;
  String secondHalfText;
  bool flag = true;

  formatNumber(int number) {
    var _formatedNumber = NumberFormat.compact().format(number);
    return _formatedNumber;
  }

  buildShowLessandMoreText(String text) {}

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return ListView(
      children: [
        for (var i in updateLizt)
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                trailing:
                    IconButton(icon: Icon(Icons.more_horiz), onPressed: () {}),
                subtitle: Text(
                  i.subName,
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontWeight: FontWeight.w400,
                      fontSize: 13),
                ),
                leading: CircleAvatar(
                  child: Image.asset(
                    i.imageUrl,
                    fit: BoxFit.fill,
                  ),
                  radius: i.descImage == null ? 30 : 25,
                  backgroundColor: Colors.grey[400],
                ),
                title: Text(
                  i.name,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.black),
                ),
              ),
              i.descImage != null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.red,
                            ),
                            child: Image.asset(
                              i.descImage,
                              fit: BoxFit.fill,
                              filterQuality: FilterQuality.high,
                            ),
                            height: height * 0.25,
                            width: width,
                          ),
                        ),
                      ),
                    )
                  : Text(''),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                child: Text(
                  i.descTitle,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: buildDesCriptionText(i),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                  padding: EdgeInsets.zero,
                                  icon: i.isLiked
                                      ? Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                          size: 30,
                                        )
                                      : Icon(
                                          Icons.favorite_border,
                                          color: Colors.grey,
                                          size: 30,
                                        ),
                                  onPressed: () {
                                    setState(() {
                                      i.isLiked = !i.isLiked;
                                    });
                                    if (i.isLiked) {
                                      setState(() {
                                        i.like += 1;
                                      });
                                    } else {
                                      setState(() {
                                        i.like -= 1;
                                      });
                                    }
                                  }),
                              Text(
                                formatNumber(i.like),
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.5)),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {},
                                icon: Icon(Icons.chat_bubble_outline_rounded,
                                    size: 25,
                                    color: Colors.black.withOpacity(0.5)),
                              ),
                              Text(
                                formatNumber(i.comment),
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.5)),
                              )
                            ],
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              icon: Icon(
                                Icons.bookmark_sharp,
                                size: 30,
                              ),
                              color: i.isSaved ? Colors.blue : Colors.grey,
                              onPressed: () {
                                setState(() {
                                  i.isSaved = !i.isSaved;
                                });
                              })
                        ],
                      ),
                    ],
                  )),
            ],
          )
      ],
    );
  }

  buildDesCriptionText(Update i) {
    if (i.desc.length > 0) {
      if (i.desc.length > 250) {
        firstHalfText = i.desc.substring(0, 250);
        secondHalfText = i.desc.substring(250, i.desc.length);
      } else {
        firstHalfText = i.desc;
        secondHalfText = '';
      }
      return secondHalfText.isEmpty
          ? Text(
              firstHalfText,
              style: TextStyle(color: Colors.black.withOpacity(0.5)),
            )
          : Column(
              children: [
                Text(
                  flag
                      ? (firstHalfText + "...")
                      : (firstHalfText + secondHalfText),
                  style: TextStyle(color: Colors.black.withOpacity(0.5)),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      flag = !flag;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        flag ? "read more" : 'read less',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                )
              ],
            );
    }
  }
}
