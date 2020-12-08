import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:todo/data/model/task_bean.dart';
import 'package:todo/data/model/task_model.dart';
import 'package:todo/data/providers/login_provider.dart';
import 'package:todo/data/repositories/task_repository.dart';
import 'package:todo/routes/app_pages.dart';

class TaskController extends GetxController {
  final RefreshController refreshController = RefreshController(initialRefresh: true);
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

  go() {
    Get.offAllNamed(Routes.LOGIN);
  }

  @override
  void onReady() async {
    super.onReady();
    LoginProvider loginProvider = Get.find<LoginProvider>();
    print(loginProvider.isLogin());
  }
}
