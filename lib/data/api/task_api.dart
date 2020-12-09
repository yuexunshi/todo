import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/data/model/task_bean.dart';
import 'package:todo/data/model/task_model.dart';
import 'package:todo/data/remote/app_response.dart';
import 'package:todo/data/remote/dio_client.dart';

class TaskApi {
  final DioClient _dio = Get.find<DioClient>();

  final String addTaskPath = "/lg/todo/add/json";

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

  //  title: 新增标题（必须）
  // 	content: 新增详情（必须）
  // 	date: 2018-08-01 预定完成时间（不传默认当天，建议传）
  // 	type: 大于0的整数（可选）；
  // 	priority 大于0的整数（可选）；
  Future<TaskBean> addTask(String title, {String content, String date, int type = 0, int priority = 0}) async {
    AppResponse appResponse = await _dio.post(addTaskPath,
        queryParameters: {'title': title, 'content': content, 'date': date, 'type': type, 'priority': priority});
    if (appResponse.ok) {
      print(appResponse.data);
      return TaskBean.fromJson(appResponse.data);
    } else {
      throw appResponse.error;
    }
  }

  //  title: 新增标题（必须）
  // 	content: 新增详情（必须）
  // 	date: 2018-08-01 预定完成时间（不传默认当天，建议传）
  // 	type: 大于0的整数（可选）；
  // 	priority 大于0的整数（可选）；
  Future<TaskBean> updateTask(
      {@required int id,
      @required String title,
      @required String date,
      String content,
      int status,
      int type,
      int priority}) async {
    AppResponse appResponse = await _dio.post('/lg/todo/update/$id/json', queryParameters: {
      'id': id,
      'title': title,
      'content': content,
      'date': date,
      'status': status,
      'type': type,
      'priority': priority
    });
    if (appResponse.ok) {
      print(appResponse.data);
      return TaskBean.fromJson(appResponse.data);
    } else {
      throw appResponse.error;
    }
  }
}
