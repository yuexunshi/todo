/*
 * @Author: your name
 * @Date: 2020-12-08 20:57:12
 * @LastEditTime: 2020-12-13 01:34:47
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /todo/lib/data/repositories/task_repository.dart
 */
import 'package:get/get.dart' hide Value;
import 'package:moor/moor.dart';
import 'package:todo/data/api/task_api.dart';
import 'package:todo/data/db/task_dao.dart';
import 'package:todo/data/db/task_database.dart';
import 'package:todo/data/model/task_model.dart';
import 'package:todo/data/providers/login_provider.dart';

class TaskRepository {
  final TaskApi api = Get.find<TaskApi>();
  final TaskDao taskDao = Get.find<TaskDao>();
  final LoginProvider loginProvider = Get.find<LoginProvider>();

  Future<TaskModel> getTask({int pageNum = 1}) async {
    if (loginProvider.isLogin()) {
      try {
        TaskModel model = await api.getTasks(pageNum: pageNum);
        if (model.datas.isNotEmpty == true)
          await taskDao.insertMultipleTasks(model.datas);
      } catch (e) {
        print('TaskRepository==getTask:$e');
      }
    }
    var data = await taskDao.getTasks(20, offset: (pageNum - 1) * 20);
    TaskModel model = TaskModel(
        curPage: pageNum,
        datas: data,
        over: ((data?.length ?? 0 < 20) == true));
    return model;
  }

  Future<Task> addTask(String title,
      {String content, String date, int type = 0, int priority = 0}) async {
    Task task;
    if (loginProvider.isLogin()) {
      try {
        task = await api.addTask(title,
            content: content, date: date, type: type, priority: priority);
      } catch (e) {
        print('TaskRepository==addTask:$e');
      }
    }
    TasksCompanion tasksCompanion = TasksCompanion(
      title: Value(task?.title ?? title),
      content: Value(task?.content ?? content),
      id: task?.id==null ? Value<int>.absent():Value(task?.id),
      date: Value(task?.date ??
          DateTime.parse(task?.dateStr ?? date).microsecondsSinceEpoch),
      dateStr: Value(task?.dateStr ?? date),
      type: Value(task?.type ?? type),
      priority: Value(task?.priority ?? priority),
    );
    return await taskDao.createTask(tasksCompanion);
  }

  Future<bool> deleteTask(int id) async {
    if (loginProvider.isLogin()) {
      try {
        await api.deleteTask(id);
      } catch (e) {
        print('TaskRepository==deleteTask:$e');
      }
    }
    int row = await taskDao.deleteTaskById(id);
    return row > 0;
  }

  Future<void> modifyTaskStatus(Task task) async {
    if (loginProvider.isLogin()) {
      try {
        await api.modifyTaskStatus(task.id, task.status);
      } catch (e) {
        print('TaskRepository==modifyTaskStatus:$e');
      }
    }
    taskDao.modifyTask(task);
  }

  Future<void> updateTask(Task task) async {
    if (loginProvider.isLogin()) {
      try {
        await api.updateTask(
            id: task.id,
            title: task.title,
            content: task.content,
            date: task.dateStr,
            status: task.status,
            type: task.type,
            priority: task.priority);
      } catch (e) {
        print('TaskRepository==updateTask:$e');
      }
    }
    await taskDao.modifyTask(task);
  }
}
