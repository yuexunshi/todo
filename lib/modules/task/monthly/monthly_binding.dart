import 'package:get/get.dart';
import 'package:todo/modules/task/monthly/monthly_controller.dart';

class MonthlyBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MonthlyController>(() => MonthlyController());
  }
}
