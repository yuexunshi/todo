import 'package:get/get.dart';
import 'package:todo/data/model/task_bean.dart';
import 'package:todo/data/model/task_model.dart';
import 'package:todo/data/repositories/task_repository.dart';
import 'package:todo/routes/app_pages.dart';
import 'package:todo/widgets/loading_dialog.dart';

class TaskController extends GetxController {
  int _pageNum = 1;
  List<TaskBean> _tasks = new List<TaskBean>();
  get tasks => _tasks;

  final TaskRepository _taskRepository = Get.find<TaskRepository>();
  @override
  void onInit() {
    super.onInit();
    print("onInit");
  }

  @override
  void onReady() {
    super.onReady();
    print("onReady");
    _load();
  }

  @override
  void onClose() {
    super.onClose();
    print("onClose");
  }

  _load() async {
    Get.loading();
    try {
      TaskModel model = await _taskRepository.getTask(pageNum: _pageNum);
      if (model.datas.isNotEmpty == true) {
        _tasks.addAll(model.datas);
        _pageNum++;
        update();
      }
    } catch (e) {
      print(e.message);
    }
    Get.dismiss();
  }

  go() {
    Get.offAllNamed(Routes.LOGIN);
  }
}
