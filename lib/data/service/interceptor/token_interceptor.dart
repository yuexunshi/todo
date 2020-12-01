import 'package:dio/dio.dart';

class TokenInterceptors extends InterceptorsWrapper {
  String _token;

  @override
  onRequest(RequestOptions options) async {
    //授权码
    if (_token == null) {
      var authorizationCode = await getAuthorization();
      if (authorizationCode != null) {
        _token = authorizationCode;
      }
    }
    options.headers["Authorization"] = _token;
    return options;
  }

  @override
  onResponse(Response response) async {
    // try {
    //   var responseJson = response.data;
    //   if (response.statusCode == 201 && responseJson["token"] != null) {
    //     _token = responseJson["token"];
    //     await LocalStorage.save(Config.MEMBER_TOKEN, _token);
    //   }
    // } catch (e) {
    //   Logger.w("token onResponse error", e: e);
    // }
    return response;
  }

  ///清除授权
  clearAuthorization() {
    // this._token = null;
    // LocalStorage.remove(Config.MEMBER_TOKEN);
  }

  ///获取授权token
  getAuthorization() async {
    // String token = await LocalStorage.get(Config.MEMBER_TOKEN);
    // if (token == null) {
    //   String memberId = await LocalStorage.get(Config.MEMBER_ID);
    //   if (memberId == null) {
    //     //!!!提示输入账号密码
    //   } else {
    //     var bytes = utf8.encode(memberId);
    //     var basic = base64.encode(bytes);
    //     //通过 basic 去获取token，获取到设置，返回token
    //     return "Basic $basic";
    //   }
    // } else {
    //   this._token = token;
    //   return token;
    // }
  }
}
