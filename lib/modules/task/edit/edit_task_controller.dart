/*
 * @Author: your name
 * @Date: 2020-12-09 20:10:32
 * @LastEditTime: 2020-12-13 01:55:06
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /todo/lib/modules/task/edit/edit_task_controller.dart
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/data/db/task_database.dart';
import 'package:todo/data/model/priority.dart';
import 'package:todo/data/repositories/task_repository.dart';
import 'package:todo/modules/task/task/task_controller.dart';
import 'package:todo/utils/extension/date_extension.dart';
import 'package:todo/utils/extension/get_extension.dart';

/// 增加task
class EditTaskController extends GetxController {
  final TaskRepository _taskRepository = Get.find<TaskRepository>();
  Task task = Get.arguments;

  /// 局部更新id
  final String updateDateId = 'update_date';
  final String updatePriorityId = 'update_priority';

  /// 表格key
  final formKey = GlobalKey<FormState>();

  /// 日期
  TextEditingController dateTimeController;

  DateTime _dateTime;

  @override
  void onInit() {
    super.onInit();
    _dateTime = DateTime.parse(task.dateStr);
    dateTimeController = TextEditingController(text: task.dateStr);
  }

  void saveTitle(String value) {
    print('saveTitle=' + value);
    task.title = value;
  }

  void saveContent(String value) {
    task.content = value;
  }

  void changePriority(String value) {
    task.priority = priorities[prioritiesStr.indexOf(value)];
  }

  void handleDatePicker() async {
    final datePick = await showDatePicker(
        context: Get.context,
        firstDate: DateTime(2000),
        initialDate: _dateTime,
        lastDate: DateTime(2100));
    if (datePick != null && datePick != _dateTime) {
      _dateTime = datePick;
      task.dateStr = _dateTime.format();
      dateTimeController.text = task.dateStr;
      update([updateDateId]);
    }
  }

  void submit() async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      try {
        Get.loading();
        await _taskRepository.updateTask(task);
        Get.dismiss();
        // 刷新列表页
        Get.find<TaskController>().update();
        // controller.updateTask(task);
        Get.back();
      } catch (e) {
        print(e);
        Get.dismiss();
        Get.snackbar('Error', e.toString());
      }
    }
  }
}
