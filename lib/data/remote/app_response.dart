import 'package:dio/dio.dart';
import 'package:todo/data/remote/app_exceptions.dart';

class AppResponse {
  bool _ok;
  bool get ok => _ok ?? false;
  dynamic _data;
  dynamic get data => _data;
  AppException _error;
  AppException get error => _error ?? AppException();

  factory AppResponse.obtain(Response response) {
    try {
      if (response.statusCode >= 200 &&
          response.statusCode < 300 &&
          response.data != null &&
          response.data['errorCode'] == 0) {
        return AppResponse._success(response.data['data']);
      }
      if (response.data != null && response.data['errorCode'] != 0) {
        return AppResponse._failure(errorMsg: response.data['errorMsg']?.toString() ?? response.statusMessage);
      }
      return AppResponse._failureFromError(HttpException(response.statusMessage, response.statusCode));
    } catch (e) {
      print('AppResponse==obtain=' + e.toString());
      return AppResponse._failure(errorMsg: e.toString());
    }
  }

  AppResponse._success([dynamic data]) {
    _data = data;
    _ok = true;
  }
  AppResponse._failure({String errorMsg}) {
    _error = AppException.obtainFromMessage(errorMsg);
  }
  AppResponse._failureFromError(AppException error) {
    _error = error;
  }
}
