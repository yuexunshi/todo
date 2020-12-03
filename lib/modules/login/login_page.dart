import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/modules/login/components/body.dart';
import 'package:todo/modules/login/login_controller.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        builder: (controller) => Scaffold(
              body: Body(),
            ));
  }
}
