import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/data/model/priority.dart';
import 'package:todo/data/model/task_bean.dart';
import 'package:todo/data/repositories/task_repository.dart';
import 'package:todo/modules/task/task/task_controller.dart';
import 'package:todo/utils/extension/date_extension.dart';
import 'package:todo/utils/extension/get_extension.dart';

/// 增加task
class EditTaskController extends GetxController {
  final TaskRepository _taskRepository = Get.find<TaskRepository>();
  TaskBean task = Get.arguments;

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
        context: Get.context, firstDate: DateTime(2000), initialDate: _dateTime, lastDate: DateTime(2100));
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
        await _taskRepository.updateTask(
            id: task.id,
            title: task.title,
            content: task.content,
            date: task.dateStr,
            status: task.status,
            type: task.type,
            priority: task.priority);
        Get.dismiss();
        TaskController controller = Get.find<TaskController>();
        controller.updateTask(task);
        Get.back();
      } catch (e) {
        Get.dismiss();
        Get.snackbar('Error', e.toString());
      }
    }
  }
}
