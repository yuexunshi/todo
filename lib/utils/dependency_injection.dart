import 'dart:io';

import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo/data/providers/app_sp_service.dart';
import 'package:todo/data/service/app_dio.dart';
import 'package:todo/data/service/interceptor/response_interceptor.dart';

class DenpendencyInjection {
  static init() async {
    await initDio();
    await Get.putAsync(() => AppSpController().init());
  }

  static initDio() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String cookiesPath = join(appDocDir.path, ".cookies/");
    AppDio.init('https://www.wanandroid.com',
        proxy: '192.168.62.10:8888', interceptors: [ResponseInterceptors()], cookiesPath: cookiesPath);
  }
}
