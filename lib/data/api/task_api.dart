import 'package:get/get.dart';

class TaskApi {
  // '/lg/todo/v2/list/页码/json'
  final String taskList = '/lg/todo/v2/list/';

  ///	页码从1开始，拼接在url上
  // status 状态， 1-完成；0未完成; 默认全部展示；
  // type 创建时传入的类型, 默认全部展示
  // priority 创建时传入的优先级；默认全部展示
  // orderby 1:完成日期顺序；2.完成日期逆序；3.创建日期顺序；4.创建日期逆序(默认)；
  // Future<AppResponse> getTasks({int type, int pageNum = 1}) async {
  //   return AppDio.request().addParam("type", type).get("$taskList$pageNum/json");
  // }
}
