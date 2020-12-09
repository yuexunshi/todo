import 'package:flutter/material.dart';
import 'package:todo/modules/task/monthly/components/body.dart';

class MonthlyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Monthly')), body: Body());
  }
}
