import 'package:get/get.dart';
import 'package:todo/data/model/task_model.dart';
import 'package:todo/data/remote/app_response.dart';
import 'package:todo/data/remote/dio_client.dart';

class TaskApi {
  final DioClient _dio = Get.find<DioClient>();

  ///	页码从1开始，拼接在url上
  // status 状态， 1-完成；0未完成; 默认全部展示；
  // type 创建时传入的类型, 默认全部展示
  // priority 创建时传入的优先级；默认全部展示
  // orderby 1:完成日期顺序；2.完成日期逆序；3.创建日期顺序；4.创建日期逆序(默认)；
  Future<TaskModel> getTasks({int type, int pageNum = 1}) async {
    AppResponse appResponse = await _dio.get("/lg/todo/v2/list/$pageNum/json");
    if (appResponse.ok) {
      return TaskModel.fromJson(appResponse.data);
    } else {
      throw appResponse.error;
    }
  }
}
