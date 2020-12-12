/*
 * @Author: your name
 * @Date: 2020-12-08 20:57:12
 * @LastEditTime: 2020-12-13 02:43:24
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /todo/lib/modules/login/components/body.dart
 */
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
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: Get.width,
            padding: EdgeInsets.fromLTRB(15.0, 115.0, 0.0, 0.0),
            child: Text('Welcome',
                style: Theme.of(context).textTheme.headline2.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    )),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(15.0, 15.0, 0.0, 0.0),
                child: Text('Back',
                    style: Theme.of(context).textTheme.headline2.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        )),
              ),
              Container(
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).primaryColorLight,
                ),
              )
            ],
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
            text: 'SKIP SIGN',
            onPressed: () => Get.offNamed(Routes.TASK),
          ),
        ],
      ),
    );
  }
}
