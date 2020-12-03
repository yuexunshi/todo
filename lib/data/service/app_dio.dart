import 'package:dio/dio.dart';

import 'base_request.dart';
import 'data_request.dart';
import 'dio_client.dart';

abstract class AppDio {
  static bool _isInit = false;
  static String _baseUrl;
  static String _proxy;
  static String _cookiesPath;
  static List<Interceptor> _interceptors;

  static DioClient _dioClient;

  static DioClient _getInstance() {
    assert(_isInit, '请先初始化');
    if (_dioClient == null) {
      _dioClient = DioClient(_baseUrl, Dio(), interceptors: _interceptors, cookiesPath: _cookiesPath);
      if (_proxy != null) {
        _dioClient.setProxy(_proxy);
      }
    }
    return _dioClient;
  }

  static init(String baseUrl, {List<Interceptor> interceptors, String proxy, String cookiesPath}) {
    assert(!_isInit, '已经初始化，禁止重复');
    _baseUrl = baseUrl;
    _interceptors = interceptors;
    _proxy = proxy;
    _cookiesPath = cookiesPath;
    _isInit = true;
  }

  static BaseRequest request() {
    DioClient client = _getInstance();
    return NormalRequest(client);
  }
}
