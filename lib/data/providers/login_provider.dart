import 'package:todo/data/local/local_login_model_reposity.dart';

class LoginProvider {
  bool isLogin() {
    return LocalLoginModelRepository.getLoginModel() != null;
  }
}
