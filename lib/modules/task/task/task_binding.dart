import 'package:get/get.dart';
import 'package:todo/data/api/task_api.dart';
import 'package:todo/data/repositories/task_repository.dart';

import 'task_controller.dart';

class TaskBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TaskApi>(() => TaskApi());
    Get.lazyPut<TaskRepository>(() => TaskRepository());
    Get.lazyPut<TaskController>(() => TaskController());
  }
}

class Persion {
  String name;
  Persion({
    this.name,
  });
}
