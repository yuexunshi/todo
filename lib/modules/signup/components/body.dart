/*
 * @Author: your name
 * @Date: 2020-12-09 20:10:32
 * @LastEditTime: 2020-12-13 02:43:48
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /todo/lib/modules/signup/components/body.dart
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/modules/login/components/alread_have_an_account_check.dart';
import 'package:todo/modules/login/components/round_paaword_field.dart';
import 'package:todo/modules/login/components/rounded_button.dart';
import 'package:todo/modules/login/components/rounded_input_field.dart';
import 'package:todo/routes/app_pages.dart';
import '../sign_up_controller.dart';

class Body extends GetView<SignUpController> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: Get.width,
            padding: EdgeInsets.fromLTRB(15.0, 115.0, 0.0, 0.0),
            child: Text('Create',
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
                child: Text('Account',
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
          RoundedPasswordField(
            onChanged: controller.onRePasswordChanged,
          ),
          SizedBox(
            height: 8,
          ),
          RoundedButton(
            text: 'SINGUP',
            onPressed: controller.sumit,
          ),
          SizedBox(
            height: 12,
          ),
          AlreadHaveAnAccoutCheck(
            login: false,
            onTap: () => Get.offNamed(Routes.LOGIN),
          ),
        ],
      ),
    );
  }
}
