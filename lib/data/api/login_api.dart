import 'package:todo/data/service/app_dio.dart';
import 'package:todo/data/service/app_response.dart';

class LoginApi {
  final String _login = '/user/login';

  Future<AppResponse> login(String username, String password) async {
    return await AppDio.request()
        .addParam('username', username)
        .addParam('password', password)
        .addParam('repassword', password)
        .post(_login);
  }
}
