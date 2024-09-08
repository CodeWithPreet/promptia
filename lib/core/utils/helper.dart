import 'package:intl/intl.dart';

String formatDateTime(String timestamp) {
  final DateTime date = DateTime.parse(timestamp);
  final DateFormat formatter = DateFormat('dd MMM yyyy');
  return formatter.format(date);
}

String formatTime(String timestamp) {
  final DateTime date = DateTime.parse(timestamp);
  final DateFormat formatter = DateFormat('hh:mm a');
  return formatter.format(date);
}
