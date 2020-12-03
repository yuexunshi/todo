import 'package:dio/dio.dart';
import 'package:todo/data/service/app_response.dart';

import 'app_error.dart';
import 'dio_client.dart';

abstract class BaseRequest<R extends BaseRequest<R>> {
  final DioClient client;

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

  BaseRequest(this.client);

  R addHeaders(Map<String, dynamic> headers) {
    if (_headers == null) {
      _headers = {};
    }
    _headers.addAll(headers);
    return this;
  }

  R addHeader(String headerKey, dynamic headerValue) {
    if (_headers == null) {
      _headers = {};
    }
    _headers[headerKey] = headerValue;
    return this;
  }

  ///请求的Content-Type
  R setContentType(String contentType) {
    if (contentType != null) {
      _contentType = contentType;
    }
    return this;
  }

  ///设置响应数据类型
  R setResponseType(ResponseType responseType) {
    if (responseType != null) {
      _responseType = responseType;
    }
    return this;
  }

  Options _generateOptions() {
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

  dynamic generateData();

  R addParams(Map<String, dynamic> params) {
    if (_queryParameters == null) {
      _queryParameters = {};
    }
    _queryParameters.addAll(params);
    return this;
  }

  R addParam(String paramKey, dynamic paramValue) {
    if (_queryParameters == null) {
      _queryParameters = {};
    }
    _queryParameters[paramKey] = paramValue;
    return this;
  }

  Future<AppResponse> post(String url) async {
    try {
      var date = generateData();
      var response = await client.post(url, data: date, options: _generateOptions(), queryParameters: _queryParameters);
      print('ResponseSuccess: ${response.toString()}');
      return _fromJson(response);
    } on DioError catch (e) {
      print('DioError==$e');
      return AppResponse.failureFromError(AppError(e));
    } catch (e) {
      return AppResponse.failureFromError(AppError(e));
    }
  }

  Future<AppResponse> get(String url) async {
    try {
      var response = await client.get(url, options: _generateOptions(), queryParameters: _queryParameters);
      print('ResponseSuccess: ${response.toString()}');
      return _fromJson(response);
    } on DioError catch (e) {
      print('DioError==$e');
      return AppResponse.failureFromError(AppError(e));
    } catch (e) {
      return AppResponse.failureFromError(AppError(e));
    }
  }

  Future<AppResponse> delete(String url) async {
    try {
      var date = generateData();
      var response =
          await client.delete(url, data: date, options: _generateOptions(), queryParameters: _queryParameters);
      print('ResponseSuccess: ${response.toString()}');
      return _fromJson(response);
    } on DioError catch (e) {
      print('DioError==$e');
      return AppResponse.failureFromError(AppError(e));
    } catch (e) {
      return AppResponse.failureFromError(AppError(e));
    }
  }

  Future<AppResponse> put(String url) async {
    try {
      var date = generateData();
      var response = await client.put(url, data: date, options: _generateOptions(), queryParameters: _queryParameters);
      if (response) print('ResponseSuccess: ${response.toString()}');
      return _fromJson(response);
    } on DioError catch (e) {
      print('DioError==$e');
      return AppResponse.failureFromError(AppError(e));
    } catch (e) {
      return AppResponse.failureFromError(AppError(e));
    }
  }

  AppResponse _fromJson(dynamic response) {
    if (response is AppResponse) {
      return response;
    } else if (response is Map) {
      if (response["errorCode"] == 0) {
        return AppResponse.success(response["data"]);
      } else {
        return AppResponse.failure(errorMsg: response["errorMsg"]?.toString());
      }
    } else {
      return AppResponse.failure();
    }
  }
}
