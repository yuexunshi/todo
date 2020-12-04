import 'package:get/get.dart';
import 'package:todo/data/api/login_api.dart';

class LoginRepository {
  final LoginApi api = Get.find<LoginApi>();

  login(String username, String password) {
    return api.login(username, password);
  }
}
