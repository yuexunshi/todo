/*
 * @Author: your name
 * @Date: 2020-12-09 20:10:32
 * @LastEditTime: 2020-12-09 22:52:15
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /todo/lib/modules/task/task/components/body.dart
 */
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:todo/data/model/task_bean.dart';
import 'package:todo/modules/task/task/components/task_widget.dart';
import 'package:todo/routes/app_pages.dart';
import '../task_controller.dart';

class Body extends GetView<TaskController> {
  final SlidableController slidableController = SlidableController();

  Widget _buildItem(BuildContext context, int index) {
    TaskBean task = controller.tasks[index];
    return Slidable(
      controller: slidableController,
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.2,
      child: TaskWidget(
        task: task,
        onItemClick: () => Get.toNamed(Routes.TASK_DETAILS, arguments: task),
        onCheckBoxChanged: (b) {
          task.status = b ? 1 : 0;
          controller.modifyTaskStatus(task);
        },
      ),
      secondaryActions: [
        IconSlideAction(
          caption: "Edit",
          color: Theme.of(context).accentColor,
          icon: Icons.edit,
          onTap: () {
            Get.toNamed(Routes.TASK_EDIT, arguments: task);
          },
        ),
        IconSlideAction(
            caption: "Delete",
            color: Colors.red,
            icon: Icons.delete,
            onTap: () => controller.deleteTask(index)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TaskController>(
      init: controller,
      builder: (_) {
        return SmartRefresher(
          header: MaterialClassicHeader(),
          controller: _.refreshController,
          enablePullDown: true,
          enablePullUp: true,
          onLoading: _.onLoadMore,
          onRefresh: _.onRefresh,
          child: ListView.builder(
            itemCount: _.tasks.length,
            itemBuilder: (context, index) {
              return _buildItem(context, index);
            },
          ),
        );
      },
    );
  }
}
