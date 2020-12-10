/*
 * @Author: your name
 * @Date: 2020-12-09 20:10:32
 * @LastEditTime: 2020-12-09 23:15:21
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /todo/lib/modules/task/monthly/monthly_controller.dart
 */
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo/data/model/task_bean.dart';
import 'package:todo/data/repositories/task_repository.dart';
import 'package:todo/utils/extension/get_extension.dart';

class MonthlyController extends GetxController {
  final CalendarController calendarController = CalendarController();
  final List<TaskBean> tasks = [];
  DateTime _date = DateTime.now();
  getTasks() async {
    // Get.loading();
    // try {
    //   // TaskBean bean =
    //   //     await _taskRepository.modifyTaskStatus(task.id, task.status);
    //   // task = bean;
    // } catch (e) {}
    // update();
    // Get.dismiss();
  }
  selectedDate(DateTime date) {
    _date = date;
  }

  modifyTaskStatus(TaskBean task) async {
    Get.loading();
    try {
      TaskBean bean = await Get.find<TaskRepository>()
          .modifyTaskStatus(task.id, task.status);
      task = bean;
    } catch (e) {}
    update();
    Get.dismiss();
  }
}
