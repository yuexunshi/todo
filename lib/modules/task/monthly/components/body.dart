import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import '../monthly_controller.dart';

class Body extends GetView<MonthlyController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
          calendarController: controller.calendarController,
          startingDayOfWeek: StartingDayOfWeek.monday,
          initialCalendarFormat: CalendarFormat.week,
        ),
        Expanded(
            // child: ListView.builder(
            //   itemCount: _.tasks.length,
            //   itemBuilder: (context, index) {
            //     return _buildItem(context, index);
            //   },
            // ),
            ),
      ],
    );
  }
}
