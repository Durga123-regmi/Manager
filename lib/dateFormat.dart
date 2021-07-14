import 'package:intl/intl.dart';

String formatDate(DateTime time) {
  String formatedDate = DateFormat('MMMM').format(time);
  return formatedDate;
}


String formatDateForPaidHitory(DateTime time) {
  String formatedDate = DateFormat('EEE  d MMMM, yyyy' ).format(time);
  return formatedDate;
}
