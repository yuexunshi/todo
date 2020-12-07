import 'package:flutter/material.dart';
import 'components/body.dart';

class AddTaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Add Task')),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Body(),
        ));
  }
}
