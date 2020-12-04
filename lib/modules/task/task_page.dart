import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/modules/task/task_controller.dart';

class TaskPage extends GetView<TaskController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TaskPage')),
      body: Container(
        child: FlatButton(
          onPressed: () {
            controller.go();
          },
          child: Text("ssss"),
        ),
      ),
    );
  }
}
