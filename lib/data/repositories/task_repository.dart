import 'package:flutter/foundation.dart';
/*
 * @Author: your name
 * @Date: 2020-12-08 20:57:12
 * @LastEditTime: 2020-12-11 00:19:55
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /todo/lib/data/repositories/task_repository.dart
 */
import 'package:get/get.dart';
import 'package:todo/data/api/task_api.dart';
import 'package:todo/data/model/task_bean.dart';
import 'package:todo/data/model/task_model.dart';

class TaskRepository {
  final TaskApi api = Get.find<TaskApi>();

  Future<TaskModel> getTask({int pageNum = 1}) {
    return api.getTasks(pageNum: pageNum);
  }

  Future<TaskBean> addTask(String title,
      {String content, String date, int type = 0, int priority = 0}) async {
    return api.addTask(title,
        content: content, date: date, type: type, priority: priority);
  }

  Future<bool> deleteTask(int id) async {
    return api.deleteTask(id);
  }

  Future<TaskBean> modifyTaskStatus(int id, int status) async {
    return api.modifyTaskStatus(id, status);
  }

  Future<TaskBean> updateTask(
      {@required int id,
      @required String title,
      @required String date,
      String content,
      int status,
      int type,
      int priority}) async {
    return api.updateTask(
        id: id,
        title: title,
        content: content,
        date: date,
        status: status,
        type: type,
        priority: priority);
  }
}
