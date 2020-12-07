import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 增加task
class AddTaskController extends GetxController {
  /// 局部更新id
  final String updateDateId = 'update_date';
  final String updatePriorityId = 'update_priority';

  /// 表格key
  final formKey = GlobalKey<FormState>();

  /// 优先级
  final Map<String, Color> priorities = {
    'Low': Colors.green,
    'Medium': Colors.blue,
    'High': Colors.red,
  };

  /// 日期
  final dateTimeController = TextEditingController(
      text: formatDate(DateTime.now(), [
    yyyy,
    '-',
    mm,
    '-',
    dd,
  ]));

  DateTime _dateTime;
  String _title;
  String _content;
  String _date;
  String _priority;

  /// page页显示
  String get priority => this._priority;

  @override
  void onInit() {
    super.onInit();
    _priority = priorities.keys.elementAt(1);
    _dateTime = DateTime.now();
  }

  void saveTitle(String value) {
    _title = value;
  }

  void saveContent(String value) {
    _content = value;
  }

  void changePriority(String value) {
    _priority = value;
  }

  void handleDatePicker() async {
    final datePick = await showDatePicker(
        context: Get.context, firstDate: DateTime(2000), initialDate: DateTime.now(), lastDate: DateTime(2100));
    if (datePick != null && datePick != _dateTime) {
      _dateTime = datePick;
      _date = formatDate(_dateTime, [
        yyyy,
        '-',
        mm,
        '-',
        dd,
      ]);
      dateTimeController.text = _date;
      update([updateDateId]);
    }
  }

  void submit() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
    }
  }
}
