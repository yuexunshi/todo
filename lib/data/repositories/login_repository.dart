import 'package:meta/meta.dart';
import 'package:todo/data/api/login_api.dart';

class LoginRepository {
  final LoginApi api;

  LoginRepository({@required this.api}) : assert(api != null);

  login(String username, String password) {
    return api.login(username, password);
  }
}
