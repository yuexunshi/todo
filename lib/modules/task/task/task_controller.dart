import 'package:get/get.dart';
import 'package:todo/modules/task/task/task_binding.dart';
import 'package:todo/routes/app_pages.dart';

class TaskController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Persion p = Get.find<Persion>();
    print("onInit" + p.name);
  }

  @override
  void onReady() {
    super.onReady();
    Persion p = Get.find<Persion>();
    print("onReady" + p.name);
  }

  @override
  void onClose() {
    super.onClose();
    Persion p = Get.find<Persion>();
    print("onClose" + p.name);
  }

  go() {
    Get.offAllNamed(Routes.LOGIN);
  }
}
