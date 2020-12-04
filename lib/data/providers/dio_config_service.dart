import 'dart:io';

import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo/data/remote/dio_config.dart';

class DioConfigController extends GetxService {
  Future<DioConfig> init() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String cookiesPath = join(appDocDir.path, ".cookies/");
    DioConfig dioConfig = DioConfig();
    dioConfig.init('https://www.wanandroid.com', proxy: '192.168.62.10:8888', cookiesPath: cookiesPath);
    return dioConfig;
  }
}
