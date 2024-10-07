import 'package:shamsi_date/shamsi_date.dart';

extension DateTimeX on DateTime {
  String get toPersianDate {
    final f = Jalali.fromDateTime(this).formatter;
    return "${f.d} ${f.mN} ${f.yyyy}";
  }
}
