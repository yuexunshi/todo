import 'package:dio/dio.dart';
import 'package:todo/data/service/app_response.dart';

class ResponseInterceptors extends InterceptorsWrapper {
  @override
  onResponse(Response response) async {
    var value;
    try {
      if (response.statusCode >= 200 &&
          response.statusCode < 300 &&
          response.data != null &&
          response.data['errorCode'] == 0) {
        value = AppResponse.success(response.data['data']);
      }
      if (response.data != null && response.data['errorCode'] != 0) {
        value = AppResponse.failure(errorMsg: response.data['errorMsg']?.toString() ?? response.statusMessage);
      }
    } catch (e) {
      print('ResponseInterceptors==catch=' + e.toString());
      value = new AppResponse.failure(errorMsg: e.toString());
    }
    return value;
  }
}
