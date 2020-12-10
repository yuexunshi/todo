/*
 * @Author: your name
 * @Date: 2020-12-08 20:57:12
 * @LastEditTime: 2020-12-08 22:11:35
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /todo/lib/modules/task/task/task_controller.dart
 */
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:todo/data/model/task_bean.dart';
import 'package:todo/data/model/task_model.dart';
import 'package:todo/data/providers/login_provider.dart';
import 'package:todo/data/repositories/task_repository.dart';
import 'package:todo/utils/extension/get_extension.dart';

class TaskController extends GetxController {
  final RefreshController refreshController =
      RefreshController(initialRefresh: true);
  int _pageNum = 1;
  List<TaskBean> _tasks = new List<TaskBean>();
  get tasks => _tasks;

  final TaskRepository _taskRepository = Get.find<TaskRepository>();

  Future<TaskModel> _load() async {
    try {
      TaskModel model = await _taskRepository.getTask(pageNum: _pageNum);
      return model;
    } catch (e) {
      print(e.message);
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

  addNewTask(TaskBean task) {
    _tasks.insert(0, task);
    update();
  }

  updateTask(TaskBean task) {
    // _tasks.firstWhere((e) => e.id == task.id);
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
      print(e);
    }
    Get.dismiss();

    // update();
  }

  modifyTaskStatus(TaskBean task) async {
    Get.loading();
    try {
      TaskBean bean =
          await _taskRepository.modifyTaskStatus(task.id, task.status);
      task = bean;
    } catch (e) {}
    update();
    Get.dismiss();
  }

  @override
  void onReady() async {
    super.onReady();
    LoginProvider loginProvider = Get.find<LoginProvider>();
    print(loginProvider.isLogin());
  }
}
