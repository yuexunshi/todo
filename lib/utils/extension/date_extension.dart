/*
 * @Author: your name
 * @Date: 2020-12-08 20:57:12
 * @LastEditTime: 2020-12-12 12:49:45
 * @LastEditors: your name
 * @Description: In User Settings Edit
 * @FilePath: /todo/lib/utils/extension/date_extension.dart
 */
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
