/*
 * @Author: your name
 * @Date: 2020-12-09 20:10:32
 * @LastEditTime: 2020-12-13 01:38:49
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /todo/lib/modules/task/task/task_page.dart
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/modules/task/task/task_controller.dart';
import 'package:todo/routes/app_pages.dart';
import 'components/body.dart';

class TaskPage extends GetView<TaskController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Task')),
      body: Body(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.TASK_ADD);
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.calendar_today_sharp),
              onPressed: () {
                Get.toNamed(Routes.TASK_MOTHLY);
              },
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Get.toNamed(Routes.PROFILE);
              },
            ),
          ],
        ),
      ),
    );
  }
}
