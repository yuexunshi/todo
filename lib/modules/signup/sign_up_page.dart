import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/modules/signup/sign_up_controller.dart';
import 'components/body.dart';

class SignUpPage extends GetView<SignUpController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
