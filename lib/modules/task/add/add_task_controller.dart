import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/data/db/task_database.dart';
import 'package:todo/data/model/priority.dart';
import 'package:todo/data/repositories/task_repository.dart';
import 'package:todo/modules/task/task/task_controller.dart';
import 'package:todo/utils/extension/date_extension.dart';
import 'package:todo/utils/extension/get_extension.dart';

/// 增加task
class AddTaskController extends GetxController {
  final TaskRepository _taskRepository = Get.find<TaskRepository>();

  /// 局部更新id
  final String updateDateId = 'update_date';
  final String updatePriorityId = 'update_priority';

  /// 表格key
  final formKey = GlobalKey<FormState>();

  /// 日期
  final dateTimeController =
      TextEditingController(text: DateTime.now().format());

  DateTime _dateTime;
  String _title;
  String _content;
  int _priority;

  @override
  void onInit() {
    super.onInit();
    _priority = priorities[0];
    _dateTime = DateTime.now();
  }

  void saveTitle(String value) {
    _title = value;
  }

  void saveContent(String value) {
    _content = value;
  }

  void changePriority(String value) {
    _priority = priorities[prioritiesStr.indexOf(value)];
  }

  void handleDatePicker() async {
    final datePick = await showDatePicker(
        context: Get.context,
        firstDate: DateTime(2000),
        initialDate: _dateTime,
        lastDate: DateTime(2100));
    if (datePick != null && datePick != _dateTime) {
      _dateTime = datePick;
      dateTimeController.text = _dateTime.format();
      update([updateDateId]);
    }
  }

  void submit() async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      try {
        Get.loading();
        Task task = await _taskRepository.addTask(_title,
            content: _content, date: _dateTime.format(), priority: _priority);
        Get.dismiss();
        TaskController controller = Get.find<TaskController>();
        controller.addNewTask(task);
        Get.back();
      } catch (e) {
        print('submit==$e');
        Get.dismiss();
        Get.snackbar('Error', e.toString());
      }
    }
  }
}
