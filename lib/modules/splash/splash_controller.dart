import 'package:get/get.dart';
import 'package:todo/routes/app_pages.dart';
import 'package:todo/utils/dependency_injection.dart';

class SplashController extends GetxController {
  printMessage() {
    print('😄message');
  }

  @override
  void onReady() async {
    super.onReady();
    await DenpendencyInjection.init();
    Get.offNamed(Routes.LOGIN);
  }
}
