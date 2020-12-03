import 'app_error.dart';

class AppResponse {
  bool _ok;
  bool get ok => _ok ?? false;
  dynamic _data;
  dynamic get data => _data;
  AppError _error;
  AppError get error => _error ?? AppError.cunstom();

  AppResponse.success([dynamic data]) {
    _data = data;
    _ok = true;
  }
  AppResponse.failure({String errorMsg}) {
    _error = AppError.cunstom(errorMsg);
  }
  AppResponse.failureFromError(AppError error) {
    _error = error;
  }
}
