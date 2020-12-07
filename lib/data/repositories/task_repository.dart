import 'package:get/get.dart';
import 'package:todo/data/api/task_api.dart';
import 'package:todo/data/model/task_model.dart';

class TaskRepository {
  final TaskApi api = Get.find<TaskApi>();

  Future<TaskModel> getTask({int pageNum = 1}) {
    return api.getTasks(pageNum: pageNum);
  }
}
