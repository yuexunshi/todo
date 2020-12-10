import 'package:get/get.dart';

import 'sign_up_controller.dart';

class SiginUpBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(() => SignUpController());
  }
}
