import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:manager/F1/billModel.dart';

Future<List<BillModel>> getmodelBillList() async {
  final parseJson = await rootBundle.loadString('asset/bills.json');
  List decodedJson = jsonDecode(parseJson);
  return decodedJson.map((bill) {
    return BillModel.fromJson(bill);
  }).toList();
}
