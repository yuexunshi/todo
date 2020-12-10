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
import 'package:todo/data/model/priority.dart';
import 'package:todo/data/model/task_bean.dart';

class TaskDetailsPage extends StatelessWidget {
  final Color color1 = Color(0xFFc44dff);
  final Color color2 = Color(0xFFD693F1);
  final Color color3 = Color(0xFFA23ED4);

  @override
  Widget build(BuildContext context) {
    TaskBean task = Get.arguments;
    return Scaffold(
        appBar: AppBar(title: Text('TaskDetailsPage')),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              Container(
                  margin: EdgeInsets.only(left: 20, top: 40),
                  child: Text('Title:',
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          .copyWith(color: Colors.black))),
              Container(
                  margin: EdgeInsets.only(left: 20, top: 8),
                  child: Text(task.title,
                      style: Theme.of(context).textTheme.subtitle1)),
              Container(
                  margin: EdgeInsets.only(left: 20, top: 20),
                  child: Text('Description:',
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(color: Colors.black))),
              Container(
                  margin: EdgeInsets.only(left: 20, top: 8),
                  child: Text(task.content ?? '',
                      style: Theme.of(context).textTheme.subtitle1)),
              Container(
                  margin: EdgeInsets.only(left: 20, top: 20),
                  child: Text('Date:',
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(color: Colors.black))),
              Container(
                  margin: EdgeInsets.only(left: 20, top: 8),
                  child: Text(task.dateStr ?? '',
                      style: Theme.of(context).textTheme.subtitle1)),
              Container(
                  margin: EdgeInsets.only(left: 20, top: 20),
                  child: Text('Priority:',
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(color: Colors.black))),
              Container(
                  margin: EdgeInsets.only(left: 20, top: 8),
                  child: Text(prioritiesStr[task.priority],
                      style: Theme.of(context).textTheme.subtitle1)),
            ],
          ),
        ));
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
