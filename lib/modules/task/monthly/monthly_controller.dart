/*
 * @Author: your name
 * @Date: 2020-12-09 20:10:32
 * @LastEditTime: 2020-12-12 13:12:15
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /todo/lib/modules/task/monthly/monthly_controller.dart
 */
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo/data/db/task_dao.dart';
import 'package:todo/data/db/task_database.dart';
import 'package:todo/modules/task/task/task_controller.dart';
import 'package:todo/utils/extension/get_extension.dart';
import 'package:todo/utils/extension/date_extension.dart';

class MonthlyController extends GetxController {
  final CalendarController calendarController = CalendarController();
  final TaskDao taskDao = Get.find<TaskDao>();

  @override
  void onReady() {
    super.onReady();
    getTasks();
  }

  final List<Task> tasks = [];
  DateTime _date = DateTime.now();
  getTasks() async {
    Get.loading();
    try {
      var list = await taskDao.getTasksWithDateStr(_date.format());
      if (list != null && list.isNotEmpty) {
        tasks.addAll(list);
      }
    } catch (e) {}
    update();
    Get.dismiss();
  }

  selectedDate(DateTime date) async {
    tasks.clear();
    _date = date;
    await getTasks();
  }

  modifyTaskStatus(Task task) async {
    try {
      TaskController taskController = Get.find<TaskController>();
      await taskController.modifyTaskStatus(task);
    } catch (e) {}
    update();
  }
}
