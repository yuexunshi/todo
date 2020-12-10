/*
 * @Author: your name
 * @Date: 2020-12-11 00:05:19
 * @LastEditTime: 2020-12-11 00:07:11
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /todo/lib/data/providers/task_dao_service.dart
 */

import 'package:get/get.dart';
import 'package:todo/data/db/task_dao.dart';
import 'package:todo/data/db/task_database.dart';

class TaskDaoController extends GetxService {
  TaskDao init() {
    TaskDatabase database = TaskDatabase();
    return TaskDao(database);
  }
}
