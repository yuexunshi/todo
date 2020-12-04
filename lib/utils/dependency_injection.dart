import 'package:get/get.dart';
import 'package:todo/data/providers/app_sp_service.dart';
import 'package:todo/data/providers/dio_config_service.dart';
import 'package:todo/data/remote/dio_client.dart';

typedef InjectFutureFunction = Future<void> Function();

/// 依赖注入
class DenpendencyInjection {
  static Future<void> init() async {
    await Get.putAsync(() => AppSpController().init());
    await Get.putAsync(() => DioConfigController().init());
    Get.put(DioClient());
  }
}
