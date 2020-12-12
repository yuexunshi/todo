/*
 * @Author: your name
 * @Date: 2020-12-09 20:10:32
 * @LastEditTime: 2020-12-12 14:00:22
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /todo/lib/modules/task/monthly/components/body.dart
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo/modules/task/task/components/task_widget.dart';
import 'package:todo/routes/app_pages.dart';
import '../monthly_controller.dart';

class Body extends GetView<MonthlyController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
          onDaySelected: (DateTime day, _, __) {
            controller.selectedDate(day);
          },
          calendarController: controller.calendarController,
          startingDayOfWeek: StartingDayOfWeek.monday,
          initialCalendarFormat: CalendarFormat.week,
          calendarStyle: CalendarStyle(
            selectedColor: Theme.of(context).accentColor,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: Container(
              padding: EdgeInsets.only(left: 30, top: 30),
              width: Get.width,
              decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Today',
                      style: Theme.of(context).textTheme.headline5.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  Expanded(
                    child: GetBuilder<MonthlyController>(builder: (_) {
                      return ListView.builder(
                        itemCount: controller.tasks.length,
                        itemBuilder: (context, index) {
                          var task = controller.tasks[index];
                          return Container(
                            margin: EdgeInsets.only(top: 10, right: 20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: TaskWidget(
                              task: task,
                              onItemClick: () => Get.toNamed(
                                  Routes.TASK_DETAILS,
                                  arguments: task),
                              onCheckBoxChanged: (b) {
                                task.status = b ? 1 : 0;
                                controller.modifyTaskStatus(task);
                              },
                            ),
                          );
                        },
                      );
                    }),
                  )
                ],
              )),
        )
      ],
    );
  }
}
