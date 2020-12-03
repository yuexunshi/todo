import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:todo/data/model/login_bean.dart';
import 'package:todo/data/providers/login_model_provider.dart';
import 'package:todo/data/repositories/login_repository.dart';
import 'package:todo/data/service/app_response.dart';
import 'package:todo/routes/app_pages.dart';
import 'package:todo/widgets/loading_dialog.dart';

class LoginController extends GetxController {
  final LoginRepository repository;
  String _username;
  String _password;
  LoginController({
    @required this.repository,
  }) : assert(repository != null);

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
    AppResponse result = await repository.login(_username, _password);
    Get.dismiss();

    if (result.ok) {
      LoginBean bean = LoginBean.fromJson(result.data);
      LoginModelProvider.saveLoginModel(bean);
      Get.offAllNamed(Routes.HOME);
    } else {}
  }
}
