import 'package:date_format/date_format.dart';

extension DateExtension on DateTime {
  String format() {
    return formatDate(this, [
      yyyy,
      '-',
      mm,
      '-',
      dd,
    ]);
  }
}
