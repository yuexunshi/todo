import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/modules/login/components/round_paaword_field.dart';
import 'package:todo/modules/login/components/rounded_button.dart';
import 'package:todo/modules/login/components/rounded_input_field.dart';
import 'package:todo/routes/app_pages.dart';
import '../login_controller.dart';
import 'alread_have_an_account_check.dart';
import 'or_divider.dart';

class Body extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: context.width,
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                child:
                    Text('Hello', style: Theme.of(context).textTheme.headline2.copyWith(fontWeight: FontWeight.bold)),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(16.0, 175.0, 0.0, 0.0),
                child: Text('There', style: TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold)),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(220.0, 175.0, 0.0, 0.0),
                child: Text('.', style: TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold, color: Colors.green)),
              )
            ],
          ),
        ),
        SizedBox(
          height: 60,
        ),
        RoundedInputField(
          hintText: 'Your Email',
          icon: Icons.person,
          onChanged: controller.onUsernameChanged,
        ),
        RoundedPasswordField(
          onChanged: controller.onPasswordChanged,
        ),
        SizedBox(
          height: 8,
        ),
        RoundedButton(
          text: 'LOGIN',
          onPressed: controller.sumit,
        ),
        SizedBox(
          height: 12,
        ),
        AlreadHaveAnAccoutCheck(
          login: true,
          onTap: () => Get.toNamed(Routes.SIGN_UP),
        ),
        SizedBox(
          height: 24,
        ),
        OrDivider(),
        SizedBox(
          height: 24,
        ),
        RoundedButton(
          text: 'SIGN UP',
          onPressed: () => Get.toNamed(Routes.SIGN_UP),
        ),
      ],
    );
  }
}
