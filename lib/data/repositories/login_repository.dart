import 'package:get/get.dart';
import 'package:todo/data/api/login_api.dart';
import 'package:todo/data/model/login_bean.dart';

class LoginRepository {
  final LoginApi api = Get.find<LoginApi>();

  Future<LoginBean> login(String username, String password) {
    return api.login(username, password);
  }
}
