import 'package:dio/dio.dart';
import 'package:get/get.dart';

class DioConfig {
  String _baseUrl;
  String get baseUrl => _baseUrl;

  String _proxy;
  String get proxy => _proxy;

  String _cookiesPath;
  String get cookiesPath => _cookiesPath;

  List<Interceptor> _interceptors;

  List<Interceptor> get interceptors => _interceptors;

  init(String baseUrl, {List<Interceptor> interceptors, String proxy, String cookiesPath}) {
    _baseUrl = baseUrl;
    _interceptors = interceptors;
    _proxy = proxy;
    _cookiesPath = cookiesPath;
  }

  static DioConfig of() => Get.find<DioConfig>();
}
