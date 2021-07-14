import 'package:flutter/material.dart';
import 'package:manager/F1/listItems.dart';
import 'package:manager/F1/menuDetails.dart';
import 'package:manager/providers.dart/myProviderAct.dart';
import 'package:provider/provider.dart';
import 'package:manager/F1/menu.dart';

class QuickAction extends StatefulWidget {
  @override
  _QuickActionState createState() => _QuickActionState();
}

class _QuickActionState extends State<QuickAction> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 5, bottom: 5, left: 15, right: 15),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Quick Actions',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
            ),
          ),
        ),
        SizedBox(
          height: height * 0.35,
          child: SingleChildScrollView(
            child: Wrap(
              children: [
                for (var i in menuType)
                  GestureDetector(
                    onTap: () async {
                      await Provider.of<MyProvider>(context, listen: false)
                          .changeMenuType(i);
                      Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                        return MenuDetail();
                      }));
                    },
                    child: buildMenuTypeWidget(height, width, i, context),
                  )
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildIcon(Icons.wallet_giftcard, 'Task'),
              buildIcon(Icons.note, 'Notes'),
              buildIcon(Icons.wallet_giftcard, 'Wallet'),
              buildIcon(Icons.wallet_giftcard, 'Updated Bill'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 15),
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(top: 5, bottom: 5),
              child: Container(
                height: height * 0.05,
                width: width * 0.7,
                child: Row(
                  children: [
                    buildTabForQr(1, 'Scan QR Code'),
                    buildTabForQr(2, 'Share My QR')
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
        ),
        Center(
            child: Padding(
          padding: EdgeInsets.only(
            bottom: 15,
          ),
          child: Icon(
            Icons.close_rounded,
            color: Colors.red,
            size: 50,
          ),
        ))
      ],
    );
  }

  Widget buildIcon(IconData iconData, String s) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData,
            color: Colors.orange,
            size: 50,
          ),
          Text(
            s,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w600, fontSize: 17),
          )
        ],
      ),
    );
  }

  int tabForQr = 1;
  buildTabForQr(int i, String s) {
    return Expanded(
        child: PhysicalModel(
      borderRadius: BorderRadius.circular(15),
      elevation: tabForQr == i ? 20 : 0,
      color: tabForQr == i ? Colors.white : Colors.grey[400],
      child: GestureDetector(
        onTap: () {
          setState(() {
            tabForQr = i;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: tabForQr == i ? Colors.white : Colors.grey[400],
          ),
          child: Center(
            child: Text(
              s,
              style: TextStyle(
                color: tabForQr == i ? Colors.black : Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
