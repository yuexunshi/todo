import 'package:get/get.dart';
import 'package:todo/routes/app_pages.dart';
import 'package:todo/utils/dependency_injection.dart';
import 'package:todo/utils/gloab_config.dart';

class SplashController extends GetxController {
  @override
  void onReady() async {
    super.onReady();
    await GloabConfig.init();
    await DenpendencyInjection.init();
    Get.offNamed(Routes.TASK);
  }
}
