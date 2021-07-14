import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:manager/F1/messageHeleper.dart';
import 'package:manager/helper/messageDataBaseHelper.dart';
import 'package:manager/providers.dart/myProviderAct.dart';
import 'package:manager/F1/newMessagePage.dart';
import 'package:manager/F1/restaurantsModel.dart';
import 'package:provider/provider.dart';

import 'chooseMenuFromBottomSheet.dart';
import 'chooseRestaurant.dart';
import 'messageModel.dart';

class MessagePage extends StatefulWidget {
  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  int tab = 1;
  String restaurantName;
  MessageHelper _helper = MessageHelper();

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Consumer<MyProvider>(
      builder: (BuildContext context, restros, _) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              actions: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return NewMessage();
                      }));
                    },
                    child: SizedBox(
                      height: height * 0.065,
                      width: height * 0.065,
                      child: Center(
                        child: Image.asset(
                          'asset/note.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                )
              ],
              leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              elevation: 0,
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: InkWell(
                  splashColor: Colors.grey[400],
                  onLongPress: () {
                    showChooseModalDialogue();
                  },
                  child: buildText(restros)),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                  child: Row(
                    children: [
                      buildTab(1, 'All chats'),
                      buildTab(2, 'Genral'),
                      buildTab(3, 'Gropups'),
                      // buildTab(4, 'Group')
                    ],
                  ),
                ),
                Expanded(
                    child: FutureBuilder<List<Chat>>(
                  future: MessageHelper().retriveChat(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Chat>> snapshot) {
                    if (snapshot.data == null ||
                        snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      if (tab == 1) {
                        print(snapshot.data);

                        return buildChatsFor1(snapshot.data);
                      } else if (tab == 2) {
                        List<Chat> _chatList2 = [];
                        // var chatList = snapshot.data.map((element) {
                        //   if (element.participatns.length == 2) {
                        //     return element;
                        //   }
                        // });

                        for (var i in snapshot.data) {
                          if (i.participatns.length == 2) {
                            _chatList2.add(i);
                          }
                        }

                        return buildChatFor2(_chatList2);
                      } else {
                        List<Chat> _chatList3 = [];
                        for (var i in snapshot.data) {
                          if (i.participatns.length > 2) {
                            _chatList3.add(i);
                          }
                        }
                        return buildChatFor3(_chatList3);
                      }
                    }
                  },
                ))
              ],
            ),
          ),
        );
      },
    );
  }

  buildTab(int i, String s) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: GestureDetector(
          onTap: () {
            setState(() {
              tab = i;
            });
          },
          child: PhysicalModel(
            elevation: 10,
            borderRadius: BorderRadius.circular(5),
            shadowColor: Colors.black,
            color: tab == i ? Colors.blue : Colors.white,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: tab == i ? Colors.blue : Colors.white),
              height: MediaQuery.of(context).size.height * 0.035,
              child: Center(
                child: Text(
                  s.toString(),
                  style: TextStyle(
                      color: tab == i ? Colors.white : Colors.grey[400]),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showChooseModalDialogue() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        )),
        context: context,
        builder: (context) {
          return ChooseRestaurant();
        });
  }

  buildText(MyProvider restros) {
    for (var i in restros.restaurants)
      if (i.isSelected == true) {
        return Text(
          restros.initialRestaurant == null
              ? i.name
              : restros.initialRestaurant.name,
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w600, fontSize: 14),
        );
      }
    return Text('');
  }

  Widget buildChatsFor1(List<Chat> data) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            subtitle: Text('ssd'),
            title: Text(
              data[index].participatns.length > 2
                  ? data[index].participatns[1] +
                      ',' +
                      data[index].participatns[2] +
                      ' and ${data[index].participatns.length - 2} ' +
                      'ohter'
                  : data[index].participatns[1],
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 15),
            ),
            leading: CircleAvatar(
              radius: 20,
              child: Image.asset(
                'asset/profilephoto.png',
                fit: BoxFit.fill,
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7.5),
            ),
          ),
        );
      },
    );
  }

  Widget buildChatFor2(List<Chat> data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (ctx, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              subtitle: Text(''),
              title: Text(
                data[index].participatns[1],
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 15),
              ),
              leading: CircleAvatar(
                radius: 20,
                child: Image.asset(
                  'asset/profilephoto.png',
                  fit: BoxFit.fill,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.5),
              ),
            ),
          );
        });
  }

  Widget buildChatFor3(List<Chat> data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (ctx, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              subtitle: Text(''),
              title: Text(
                data[index].participatns[1] +
                    ',' +
                    data[index].participatns[2] +
                    ' and ${data[index].participatns.length - 2} ' +
                    'ohter',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 15),
              ),
              leading: CircleAvatar(
                radius: 20,
                child: Image.asset(
                  'asset/profilephoto.png',
                  fit: BoxFit.fill,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.5),
              ),
            ),
          );
        });
  }
}
