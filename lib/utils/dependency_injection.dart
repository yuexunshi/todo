/*
 * @Author: your name
 * @Date: 2020-12-08 20:57:12
 * @LastEditTime: 2020-12-11 01:38:08
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /todo/lib/utils/dependency_injection.dart
 */
import 'package:get/get.dart';
import 'package:todo/data/providers/app_sp_service.dart';
import 'package:todo/data/providers/dio_config_service.dart';
import 'package:todo/data/providers/login_provider.dart';
import 'package:todo/data/providers/task_dao_service.dart';
import 'package:todo/data/remote/dio_client.dart';

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
    // 数据库
    Get.put(TaskDaoController().init());
  }
}
