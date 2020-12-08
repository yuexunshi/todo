import 'package:get/get.dart';
import 'package:todo/data/providers/login_provider.dart';
import 'package:todo/routes/app_pages.dart';
import 'package:todo/utils/dependency_injection.dart';
import 'package:todo/utils/gloab_config.dart';

class SplashController extends GetxController {
  @override
  void onReady() async {
    super.onReady();
    await GloabConfig.init();
    await DenpendencyInjection.init();
    LoginProvider loginProvider = Get.find<LoginProvider>();
    print(loginProvider);
    // 如果未登录就登录
    // 如果已登录就去task页面
    if (loginProvider.isLogin()) {
      Get.offNamed(Routes.TASK);
    } else {
      Get.offNamed(Routes.LOGIN);
    }
  }
}
