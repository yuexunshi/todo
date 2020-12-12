/*
 * @Author: your name
 * @Date: 2020-12-08 20:57:12
 * @LastEditTime: 2020-12-12 15:33:25
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /todo/lib/modules/task/task/task_controller.dart
 */
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:todo/data/db/task_database.dart';
import 'package:todo/data/model/task_model.dart';
import 'package:todo/data/providers/login_provider.dart';
import 'package:todo/data/repositories/task_repository.dart';
import 'package:todo/utils/extension/get_extension.dart';

class TaskController extends GetxController {
  final RefreshController refreshController =
      RefreshController(initialRefresh: true);
  int _pageNum = 1;
  List<Task> _tasks = new List<Task>();
  List<Task> get tasks => _tasks;

  final TaskRepository _taskRepository = Get.find<TaskRepository>();

  Future<TaskModel> _load() async {
    try {
      TaskModel model = await _taskRepository.getTask(pageNum: _pageNum);
      return model;
    } catch (e) {
      print('_load' + e.toString());
      return null;
    }
  }

  onRefresh() async {
    _pageNum = 1;
    TaskModel model = await _load();
    if (model == null) {
      refreshController.refreshFailed();
      return;
    } else {
      refreshController.refreshCompleted();
    }
    if (model.over == true) {
      refreshController.loadNoData();
    }

    if (model.datas?.isNotEmpty == true) {
      _tasks.clear();
      _tasks.addAll(model.datas);
      _pageNum++;
      update();
    }
  }

  onLoadMore() async {
    TaskModel model = await _load();
    if (model == null) {
      refreshController.loadFailed();
      return;
    }
    if (model.over == true) {
      refreshController.loadNoData();
    } else {
      refreshController.loadComplete();
    }

    if (model.datas?.isNotEmpty == true) {
      _tasks.addAll(model.datas);
      _pageNum++;
      update();
    }
  }

  addNewTask(Task task) {
    _tasks.insert(0, task);
    update();
  }

  deleteTask(int index) async {
    Get.loading();
    try {
      bool success = await _taskRepository.deleteTask(_tasks[index].id);
      if (success) {
        _tasks.removeAt(index);
        update();
      }
    } catch (e) {
      print('deleteTask' + e.toString());
    }
    Get.dismiss();

    // update();
  }

  modifyTaskStatus(Task task) async {
    Get.loading();
    try {
      await _taskRepository.modifyTaskStatus(task);
      var newTask = _tasks.firstWhere(
          (element) => element.id == task.id && element.status != task.status,
          orElse: () => null);
      if (newTask != null) {
        newTask.status = task.status;
        // print("modifyTaskStatus==${newTask.status}");
        // int index = _tasks.indexOf(newTask);
        // print("modifyTaskStatus==${_tasks[index]}");
      }
      update();
    } catch (e) {
      print('modifyTaskStatus' + e.toString());
    }
    Get.dismiss();
  }

  @override
  void onReady() async {
    super.onReady();
    LoginProvider loginProvider = Get.find<LoginProvider>();
    print(loginProvider.isLogin());
  }
}
