import 'package:dio/dio.dart';

import 'dio_client.dart';

abstract class AppDio {
  static String baseUrl;
  static List<Interceptor> interceptors;

  static DioClient _dioClient;

  static DioClient getInstance() {
    assert(baseUrl != null, '请先配置baseUrl');
    _dioClient ??= DioClient(baseUrl, Dio(), interceptors: interceptors);
    return _dioClient;
  }
}
