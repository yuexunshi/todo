/*
 * @Author: your name
 * @Date: 2020-12-09 20:10:32
 * @LastEditTime: 2020-12-09 23:14:37
 * @LastEditors: your name
 * @Description: In User Settings Edit
 * @FilePath: /todo/lib/modules/task/monthly/monthly_binding.dart
 */
import 'package:get/get.dart';
import 'package:todo/data/api/task_api.dart';
import 'package:todo/data/repositories/task_repository.dart';
import 'package:todo/modules/task/monthly/monthly_controller.dart';

class MonthlyBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TaskApi>(() => TaskApi());
    Get.lazyPut<TaskRepository>(() => TaskRepository());
    Get.lazyPut<MonthlyController>(() => MonthlyController());
  }
}
