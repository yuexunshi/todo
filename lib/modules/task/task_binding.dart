import 'package:get/get.dart';
import 'package:todo/modules/task/task_controller.dart';

class TaskBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Persion>(() => Persion(name: "sss"));
    Get.lazyPut<TaskController>(() => TaskController());
  }
}

class Persion {
  String name;
  Persion({
    this.name,
  });
}
