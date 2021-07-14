import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:manager/helper/messageDataBaseHelper.dart';

import 'messageModel.dart';

Future<List<Messages>> getMessages() async {
  final rawmeessages = await rootBundle.loadString('asset/message.json');
  List decodedJsonData = json.decode(rawmeessages);

  return decodedJsonData.map((e) => Messages.fromJson(e)).toList();
}
