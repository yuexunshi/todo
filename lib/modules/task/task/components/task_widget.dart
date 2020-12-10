/*
 * @Author: your name
 * @Date: 2020-12-09 20:10:32
 * @LastEditTime: 2020-12-09 22:49:25
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /todo/lib/modules/task/task/components/task_item.dart
 */
import 'package:flutter/material.dart';
import 'package:todo/data/model/priority.dart';
import 'package:todo/data/model/task_bean.dart';
import 'package:todo/modules/task/task/components/round_check_box.dart';

/// task 展示控件
class TaskWidget extends StatelessWidget {
  final TaskBean task;
  final VoidCallback onItemClick;
  final ValueChanged<bool> onCheckBoxChanged;

  const TaskWidget({
    Key key,
    @required this.task,
    this.onItemClick,
    this.onCheckBoxChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.03),
              offset: Offset(0, 2),
              blurRadius: 5,
              spreadRadius: 1)
        ],
      ),
      child: _buildRow(context),
    );
  }

  Widget _buildRow(BuildContext context) {
    return InkWell(
      onTap: onItemClick,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            width: 25,
            height: 25,
            child: RoundCheckBox(
              value: task.status == 1,
              size: Size(25, 25),
              color: priorityColor[task.priority],
              onChanged: onCheckBoxChanged,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                task.title,
                style: Theme.of(context).textTheme.subtitle1.copyWith(
                      fontSize: 18,
                      decoration: task.status == 1
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(task.dateStr,
                  style: Theme.of(context).textTheme.caption.copyWith(
                        fontSize: 14,
                        decoration: task.status == 1
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      )),
            ],
          ),
          Spacer(),
          Container(
            width: 5,
            height: 50,
            color: priorityColor[task.priority],
          ),
        ],
      ),
    );
  }
}
