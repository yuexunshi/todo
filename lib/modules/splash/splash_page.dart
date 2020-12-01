import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:todo/modules/splash/splash_controller.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SplashPage')),
      body: GetBuilder<SplashController>(
        builder: (_) {
          return Center(
            child: FlatButton(
              onPressed: () {
                _.printMessage();
              },
              child: Text('sss'),
            ),
          );
        },
      ),
    );
  }
}
