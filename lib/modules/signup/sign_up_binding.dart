import 'package:get/get.dart';
import 'package:todo/data/api/login_api.dart';
import 'package:todo/data/repositories/login_repository.dart';

import 'sign_up_controller.dart';

class SiginUpBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginApi());
    Get.lazyPut(() => LoginRepository());
    Get.lazyPut<SignUpController>(() => SignUpController());
  }
}
