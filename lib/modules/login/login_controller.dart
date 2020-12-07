import 'package:get/get.dart';
import 'package:todo/data/model/login_bean.dart';
import 'package:todo/data/local/local_login_model_reposity.dart';
import 'package:todo/data/repositories/login_repository.dart';
import 'package:todo/routes/app_pages.dart';
import 'package:todo/widgets/loading_dialog.dart';

class LoginController extends GetxController {
  final LoginRepository repository = Get.find<LoginRepository>();
  String _username;
  String _password;

  void onUsernameChanged(String username) {
    _username = username;
  }

  void onPasswordChanged(String password) {
    _password = password;
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
    Get.loading();
    try {
      LoginBean bean = await repository.login(_username, _password);
      Get.dismiss();
      LocalLoginModelRepository.saveLoginModel(bean);
      Get.offAllNamed(Routes.TASK);
    } catch (e) {
      Get.dismiss();
      Get.snackbar('Error', e.message ?? "登录失败");
    }
  }
}
