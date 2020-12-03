import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/modules/login/components/alread_have_an_account_check.dart';
import 'package:todo/modules/login/components/round_paaword_field.dart';
import 'package:todo/modules/login/components/rounded_button.dart';
import 'package:todo/modules/login/components/rounded_input_field.dart';
import 'package:todo/routes/app_pages.dart';
import 'package:todo/theme/app_theme.dart';
import '../sign_up_controller.dart';

class Body extends GetView<SignUpController> {
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
                    Text('SIGNUP', style: Theme.of(context).textTheme.headline2.copyWith(fontWeight: FontWeight.bold)),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(16.0, 175.0, 0.0, 0.0),
                child: Text('NOW', style: TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold)),
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
          onChanged: (text) {},
        ),
        RoundedPasswordField(
          onChanged: (text) {},
        ),
        SizedBox(
          height: 8,
        ),
        RoundedButton(
          text: 'SINGUP',
          onPressed: () {},
        ),
        SizedBox(
          height: 12,
        ),
        AlreadHaveAnAccoutCheck(
          login: false,
          onTap: () => Get.offNamed(Routes.LOGIN),
        ),
      ],
    );
  }
}
