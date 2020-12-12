/*
 * @Author: your name
 * @Date: 2020-12-09 20:53:52
 * @LastEditTime: 2020-12-12 13:52:05
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /todo/lib/modules/task/details/task_details.dart
 */
/*
 * @Author: your name
 * @Date: 2020-12-09 20:53:52
 * @LastEditTime: 2020-12-09 22:11:35
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /todo/lib/modules/task/details/task_details.dart
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/data/db/task_database.dart';
import 'package:todo/data/model/priority.dart';

class TaskDetailsPage extends StatelessWidget {
  final Color color1 = Color(0xFFc44dff);
  final Color color2 = Color(0xFFD693F1);
  final Color color3 = Color(0xFFA23ED4);

  @override
  Widget build(BuildContext context) {
    Task task = Get.arguments;
    return Scaffold(
        appBar: AppBar(title: Text('TaskDetailsPage')),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              _buildKey(context, 'Title:'),
              _buildValue(context, task.title),
              _buildKey(context, 'Description:'),
              _buildValue(context, task.content),
              _buildKey(context, 'Date:'),
              _buildValue(context, task.dateStr),
              _buildKey(context, 'Priority:'),
              _buildValue(context, prioritiesStr[task.priority]),
              _buildKey(context, '进度:'),
              _buildValue(context, task.status == 0 ? '未完成' : '已完成'),
            ],
          ),
        ));
  }

  Widget _buildValue(
    BuildContext context,
    String value,
  ) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(
              color: Theme.of(context).primaryColor, width: 1), // 边色与边宽度
          //        borderRadius: new BorderRadius.circular((20.0)), // 圆角度
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Text(value ?? '', style: Theme.of(context).textTheme.subtitle1));
  }

  Widget _buildKey(
    BuildContext context,
    String value,
  ) {
    return Container(
        margin: EdgeInsets.only(left: 20, top: 0),
        child: Text(value,
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(color: Colors.black)));
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
        height: 250,
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              top: -150,
              left: -100,
              bottom: 0,
              child: Container(
                width: 350,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [color3, color1]),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: color2,
                        offset: Offset(4, 4),
                        blurRadius: 10,
                      )
                    ]),
              ),
            ),
            Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(colors: [color3, color2]),
                    boxShadow: [
                      BoxShadow(
                          color: color2, offset: Offset(1, 1), blurRadius: 4)
                    ])),
            Positioned(
              top: 100,
              right: 220,
              child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(colors: [color3, color2]),
                      boxShadow: [
                        BoxShadow(
                            color: color2, offset: Offset(1, 1), blurRadius: 4)
                      ])),
            ),
            Container(
                margin: EdgeInsets.only(top: 60, left: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hi Man',
                        style: Theme.of(context).textTheme.headline5.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 10,
                    ),
                    Text('get it today!',
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                              color: Colors.white,
                            )),
                  ],
                ))
          ],
        ));
  }
}
