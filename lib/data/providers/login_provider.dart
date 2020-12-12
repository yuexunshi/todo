/*
 * @Author: your name
 * @Date: 2020-12-08 20:57:12
 * @LastEditTime: 2020-12-11 00:53:29
 * @LastEditors: your name
 * @Description: In User Settings Edit
 * @FilePath: /todo/lib/data/providers/login_provider.dart
 */
import 'package:todo/data/local/local_login_model_reposity.dart';

class LoginProvider {
  bool isLogin() {
    return LocalLoginModelRepository.getLoginModel() != null;
  }
}
