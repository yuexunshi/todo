import 'package:get/get.dart';
import 'package:todo/data/providers/login_provider.dart';
import 'package:todo/routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onReady() async {
    super.onReady();

    await Future.delayed(Duration(seconds: 3));
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
