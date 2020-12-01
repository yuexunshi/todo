import 'package:dio/dio.dart';
import 'package:todo/data/service/result.dart';

import 'app_dio.dart';

class BaseRequest {
//请求头
  Map<String, dynamic> _headers;

  /// 请求的Content-Type，默认值是"application/json; charset=utf-8".
  /// 如果您想以"application/x-www-form-urlencoded"格式编码请求数据,
  /// 可以设置此选项为 `Headers.formUrlEncodedContentType`,  这样[Dio]
  /// 就会自动编码请求体.
  String _contentType;

  /// [responseType] 表示期望以那种格式(方式)接受响应数据。
  /// 目前 [ResponseType] 接受三种类型 `JSON`, `STREAM`, `PLAIN`.
  ///
  /// 默认值是 `JSON`, 当响应头中content-type为"application/json"时，dio 会自动将响应内容转化为json对象。
  /// 如果想以二进制方式接受响应数据，如下载一个二进制文件，那么可以使用 `STREAM`.
  ///
  /// 如果想以文本(字符串)格式接收响应数据，请使用 `PLAIN`.
  ResponseType _responseType;
  //请求参数
  Map<String, dynamic /*String|Iterable<String>*/ > _queryParameters;

  dynamic _data;

  BaseRequest addData(dynamic data) {
    if (data == null) {
      _data = data;
    }
    return this;
  }

  BaseRequest addHeaders(Map<String, dynamic> headers) {
    if (_headers == null) {
      _headers = {};
    }
    _headers.addAll(headers);
    return this;
  }

  BaseRequest addHeader(String headerKey, dynamic headerValue) {
    if (_headers == null) {
      _headers = {};
    }
    _headers[headerKey] = headerValue;
    return this;
  }

  ///请求的Content-Type
  BaseRequest setContentType(String contentType) {
    if (_contentType != null) {
      _contentType = contentType;
    }
    return this;
  }

  ///设置响应数据类型
  BaseRequest setResponseType(ResponseType responseType) {
    if (responseType != null) {
      _responseType = responseType;
    }
    return this;
  }

  Options generateOptions() {
    var options = Options();
    if (_headers != null) {
      options..headers = _headers;
    }
    if (_contentType != null) {
      options..contentType = _contentType;
    }
    if (_responseType != null) {
      options..responseType = _responseType;
    }
    return options;
  }

  BaseRequest addParams(Map<String, dynamic> params) {
    if (_queryParameters == null) {
      _queryParameters = {};
    }
    _queryParameters.addAll(params);
    return this;
  }

  BaseRequest addParam(String paramKey, dynamic paramValue) {
    if (_queryParameters == null) {
      _queryParameters = {};
    }
    _queryParameters[paramKey] = paramValue;
    return this;
  }

  Future<Result> post(String url) async {
    try {
      final dio = AppDio.getInstance();
      var response = await dio.post(url, data: _data, options: generateOptions(), queryParameters: _queryParameters);
      print('ResponseSuccess: ${response.toString()}');
    } on DioError catch (e) {
      print('DioError==$e');
    } catch (e) {
      print('未知类型');
    }
    return Result.success();
  }

  Future<Result> get(String url) async {
    try {
      final dio = AppDio.getInstance();
      var response = await dio.get(url, options: generateOptions(), queryParameters: _queryParameters);
      print('ResponseSuccess: ${response.toString()}');
    } on DioError catch (e) {
      print('DioError==$e');
    } catch (e) {
      print('未知类型');
    }
    return Result.success();
  }

  Future<Result> delete(String url) async {
    try {
      final dio = AppDio.getInstance();
      var response = await dio.delete(url, data: _data, options: generateOptions(), queryParameters: _queryParameters);
      print('ResponseSuccess: ${response.toString()}');
    } on DioError catch (e) {
      print('DioError==$e');
    } catch (e) {
      print('未知类型');
    }
    return Result.success();
  }

  Future<Result> put(String url) async {
    try {
      final dio = AppDio.getInstance();
      var response = await dio.put(url, data: _data, options: generateOptions(), queryParameters: _queryParameters);
      print('ResponseSuccess: ${response.toString()}');
    } on DioError catch (e) {
      print('DioError==$e');
    } catch (e) {
      print('未知类型');
    }
    return Result.success();
  }
}
