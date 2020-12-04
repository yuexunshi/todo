import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/foundation.dart';

import 'dio_config.dart';

const _defaultConnectTimeout = Duration.millisecondsPerMinute;
const _defaultSendTimeout = Duration.millisecondsPerMinute;
const _defaultReceiveTimeout = Duration.millisecondsPerMinute;

class AppDio with DioMixin implements Dio {
  DioConfig _dioConfig = DioConfig.of();
  AppDio._([BaseOptions options]) {
    options ??= BaseOptions(
      baseUrl: _dioConfig.baseUrl,
      contentType: 'application/json',
      connectTimeout: _defaultConnectTimeout,
      sendTimeout: _defaultSendTimeout,
      receiveTimeout: _defaultReceiveTimeout,
    );

    this.options = options;

    //DioCacheManager
    interceptors.add(DioCacheManager(
      CacheConfig(
        baseUrl: _dioConfig.baseUrl,
      ),
    ).interceptor);
    //Cookie管理
    interceptors.add(CookieManager(PersistCookieJar(dir: _dioConfig.cookiesPath)));

    if (kDebugMode) {
      interceptors.add(LogInterceptor(
          responseBody: true,
          error: true,
          requestHeader: false,
          responseHeader: false,
          request: false,
          requestBody: true));
    }
    if (_dioConfig.interceptors?.isNotEmpty ?? false) {
      interceptors.addAll(interceptors);
    }
    httpClientAdapter = DefaultHttpClientAdapter();
  }

  setProxy(String proxy) {
    (httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
      // config the http client
      client.findProxy = (uri) {
        //proxy all request to localhost:8888
        return "PROXY $proxy";
      };
      // you can also create a HttpClient to dio
      // return HttpClient();
    };
  }

  static Dio getInstance() => AppDio._();
}
