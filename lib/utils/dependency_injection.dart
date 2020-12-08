import 'package:get/get.dart';
import 'package:todo/data/providers/app_sp_service.dart';
import 'package:todo/data/providers/dio_config_service.dart';
import 'package:todo/data/providers/login_provider.dart';
import 'package:todo/data/remote/dio_client.dart';

typedef InjectFutureFunction = Future<void> Function();

/// 依赖注入
class DenpendencyInjection {
  static Future<void> init() async {
    // shared_preferences
    await Get.putAsync(() => AppSpController().init());
    // dio配置信息
    await Get.putAsync(() => DioConfigController().init());
    //  网络请求
    Get.put(DioClient());
    // 登录信息提供者
    Get.put(LoginProvider());
  }
}
