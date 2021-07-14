import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget {
  @override
  _NewMessageState createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'To',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'Search...', border: InputBorder.none),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: Text(
                  'Co-workers',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: _workers.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: Container(
                            child: Stack(
                              children: [
                                Center(),
                                _workers[index].isOnline == true
                                    ? Align(
                                        alignment: Alignment(1, 0.9),
                                        child: Container(
                                          height: height * 0.03,
                                          width: width * 0.03,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.green,
                                              border: Border.all(
                                                  width: 1,
                                                  color: Colors.white)),
                                        ))
                                    : Text(''),
                              ],
                            ),
                            height: height * 0.15,
                            width: width * 0.15,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey[400]),
                          ),
                          dense: true,
                          title: Text(
                            _workers[index].name,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(
                  right: 15, left: 15, bottom: 15, top: 15),
              child: SizedBox(
                height: height * 0.02,
                width: height * 0.03,
                child: Image.asset(
                  'asset/send.png',
                  fit: BoxFit.fill,
                ),
              ),
            )
          ],
          centerTitle: true,
          title: Text(
            'New Message',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16),
          ),
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
      ),
    );
  }

  List<CoWorkers> _workers = [
    CoWorkers(name: 'Manish Paudel', isOnline: true),
    CoWorkers(name: 'Swadesh Nepali', isOnline: false),
    CoWorkers(name: 'Binod Banstola', isOnline: true),
    CoWorkers(name: 'Subin Bhandari', isOnline: true),
    CoWorkers(name: 'Durga Prasad Regmi', isOnline: true),
    CoWorkers(name: 'Binita Nepali', isOnline: false),
    CoWorkers(name: 'Anish Acharya', isOnline: true),
    CoWorkers(name: 'Adarsha Lanchan', isOnline: true),
    CoWorkers(name: 'Samir Kc', isOnline: false),
    CoWorkers(name: 'Manish Paudel', isOnline: true)
  ];
}

class CoWorkers {
  String name;
  bool isOnline;

  CoWorkers({this.name, this.isOnline});
}
