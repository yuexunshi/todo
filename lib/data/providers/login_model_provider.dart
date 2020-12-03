import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/data/model/login_bean.dart';

const String keyLoginModel = 'key_login_model';

class LoginModelProvider {
  static saveLoginModel(LoginBean bean) {
    SharedPreferences sp = Get.find<SharedPreferences>();
    sp.setString(keyLoginModel, jsonEncode(bean));
  }

  static LoginBean getLoginModel() {
    SharedPreferences sp = Get.find<SharedPreferences>();
    try {
      var json = sp.getString(keyLoginModel);
      return jsonDecode(json) as LoginBean;
    } catch (e) {
      return null;
    }
  }
}
