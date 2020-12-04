import 'package:get/get.dart';
import 'package:todo/data/model/login_bean.dart';
import 'package:todo/data/remote/app_response.dart';
import 'package:todo/data/remote/dio_client.dart';

class LoginApi {
  final String _login = '/user/login';
  final DioClient _dio = Get.find<DioClient>();
  Future<LoginBean> login(String username, String password) async {
    AppResponse appResponse =
        await _dio.post(_login, queryParameters: {"username": username, "password": password, "repassword": password});
    if (appResponse.ok) {
      return LoginBean.fromJson(appResponse.data);
    } else {
      throw appResponse.error;
    }
  }
}
