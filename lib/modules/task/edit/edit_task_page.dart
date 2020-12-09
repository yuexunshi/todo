import 'package:flutter/material.dart';
import 'components/body.dart';

class EditTaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Edit Task')),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Body(),
        ));
  }
}
