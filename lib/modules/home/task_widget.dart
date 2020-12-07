import 'package:flutter/material.dart';
import 'package:todo/data/model/task_bean.dart';

class TaskWidget extends StatelessWidget {
  final List<TaskBean> list = [
    TaskBean(title: "我的第一个任务", status: 0),
    TaskBean(title: "我的第二个任务", status: 0),
    TaskBean(title: "我的第三个任务", status: 0),
    TaskBean(title: "我的第四个任务", status: 0),
    TaskBean(title: "我的第五个任务", status: 1),
    TaskBean(title: "我的第六个任务", status: 1),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        TaskBean task = list[index];
        return task.status == 0 ? _buildUnCompleteItem(context, task) : _buildCompleteItem(context, task);
      },
    );
  }

  Widget _buildCompleteItem(BuildContext context, TaskBean task) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 24, right: 20),
      child: Row(
        children: [
          Icon(
            Icons.radio_button_checked,
            color: Theme.of(context).accentColor,
          ),
          SizedBox(
            width: 28,
          ),
          Text(task.title),
        ],
      ),
    );
  }

  Widget _buildUnCompleteItem(BuildContext context, TaskBean task) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 24, right: 20),
      child: Row(
        children: [
          Icon(
            Icons.radio_button_unchecked,
            color: Theme.of(context).accentColor,
          ),
          SizedBox(
            width: 28,
          ),
          Text(task.title),
        ],
      ),
    );
  }
}
