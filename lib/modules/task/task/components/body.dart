import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:todo/data/model/task_bean.dart';
import '../task_controller.dart';
import 'round_check_box.dart';

class Body extends GetView<TaskController> {
  Widget _buildItem(BuildContext context, int index) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.2,
      child: Container(
        height: 80,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.03), offset: Offset(0, 2), blurRadius: 5, spreadRadius: 1)
          ],
        ),
        child: _buildRow(context, index),
      ),
      secondaryActions: [
        IconSlideAction(
          caption: "Edit",
          color: Colors.white,
          icon: Icons.edit,
          onTap: () {},
        ),
        IconSlideAction(
          caption: "Delete",
          color: Colors.white,
          icon: Icons.delete,
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildRow(BuildContext context, int index) {
    TaskBean task = controller.tasks[index];
    return Row(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          width: 25,
          height: 25,
          child: RoundCheckBox(
            value: false,
            size: Size(25, 25),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(task.title, style: Theme.of(context).textTheme.headline6.copyWith(fontSize: 18)),
            SizedBox(
              height: 5,
            ),
            Text(task.dateStr),
          ],
        ),
        Spacer(),
        Container(
          width: 5,
          height: 50,
          color: Colors.red,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TaskController>(
      init: controller,
      builder: (_) {
        return ListView.builder(
          itemCount: _.tasks.length,
          itemBuilder: (context, index) {
            return _buildItem(context, index);
          },
        );
      },
    );
  }
}
