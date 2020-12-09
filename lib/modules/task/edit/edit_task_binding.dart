import 'package:get/get.dart';
import 'package:todo/data/api/task_api.dart';
import 'package:todo/data/repositories/task_repository.dart';
import 'edit_task_controller.dart';

class EditTaskBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TaskApi>(() => TaskApi());
    Get.lazyPut<TaskRepository>(() => TaskRepository());
    Get.lazyPut<EditTaskController>(() => EditTaskController());
  }
}
