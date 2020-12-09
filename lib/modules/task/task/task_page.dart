import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/modules/task/task/task_controller.dart';
import 'package:todo/routes/app_pages.dart';
import 'components/body.dart';

class TaskPage extends GetView<TaskController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TaskPage')),
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
              icon: Icon(Icons.settings),
              onPressed: () {
                Get.toNamed(Routes.TASK_MOTHLY);
              },
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
