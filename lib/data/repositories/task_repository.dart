import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:todo/data/api/task_api.dart';
import 'package:todo/data/model/task_bean.dart';
import 'package:todo/data/model/task_model.dart';

class TaskRepository {
  final TaskApi api = Get.find<TaskApi>();

  Future<TaskModel> getTask({int pageNum = 1}) {
    return api.getTasks(pageNum: pageNum);
  }

  Future<TaskBean> addTask(String title, {String content, String date, int type = 0, int priority = 0}) async {
    return api.addTask(title, content: content, date: date, type: type, priority: priority);
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
        id: id, title: title, content: content, date: date, status: status, type: type, priority: priority);
  }
}
