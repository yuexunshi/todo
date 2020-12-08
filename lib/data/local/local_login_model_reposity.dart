import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/data/model/login_bean.dart';

class LocalLoginModelRepository {
  static final String keyLoginModel = 'key_login_model';

  static saveLoginModel(LoginBean bean) {
    SharedPreferences sp = Get.find<SharedPreferences>();
    sp.setString(keyLoginModel, jsonEncode(bean.toJson()));
  }

  static LoginBean getLoginModel() {
    SharedPreferences sp = Get.find<SharedPreferences>();
    try {
      var json = sp.getString(keyLoginModel);
      return LoginBean.fromJson(jsonDecode(json));
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
