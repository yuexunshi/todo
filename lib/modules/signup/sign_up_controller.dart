/*
 * @Author: your name
 * @Date: 2020-12-09 20:10:32
 * @LastEditTime: 2020-12-13 01:32:23
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /todo/lib/modules/signup/sign_up_controller.dart
 */
import 'package:get/get.dart';
import 'package:todo/data/local/local_login_model_reposity.dart';
import 'package:todo/data/model/login_bean.dart';
import 'package:todo/data/repositories/login_repository.dart';
import 'package:todo/routes/app_pages.dart';
import 'package:todo/utils/extension/get_extension.dart';

class SignUpController extends GetxController {
  final LoginRepository repository = Get.find<LoginRepository>();
  String _username;
  String _password;
  String _repassword;

  void onUsernameChanged(String username) {
    _username = username.trim();
  }

  void onPasswordChanged(String password) {
    _password = password.trim();
  }

  void onRePasswordChanged(String repassword) {
    _repassword = repassword.trim();
  }

  sumit() async {
    if (_username == null || _username.trim.toString().isEmpty) {
      Get.snackbar('Hi', 'Your Email not be null');
      return;
    }

    if (_password == null || _password.trim.toString().isEmpty) {
      Get.snackbar('Hi', 'Your Password not be null');
      return;
    }
    if (_repassword == null || _repassword.trim.toString().isEmpty) {
      Get.snackbar('Hi', 'Your _repassword not be null');
      return;
    }
    Get.loading();
    try {
      LoginBean bean =
          await repository.register(_username, _password, _repassword);
      Get.dismiss();
      LocalLoginModelRepository.saveLoginModel(bean);
      Get.offAllNamed(Routes.TASK);
    } catch (e) {
      Get.dismiss();
      Get.snackbar('Error', e.message ?? "注册失败");
    }
  }
}
