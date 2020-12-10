/*
 * @Author: your name
 * @Date: 2020-12-08 20:57:12
 * @LastEditTime: 2020-12-11 00:13:41
 * @LastEditors: your name
 * @Description: In User Settings Edit
 * @FilePath: /todo/lib/modules/login/components/alread_have_an_account_check.dart
 */
import 'package:flutter/material.dart';
import 'package:todo/theme/app_theme.dart';

class AlreadHaveAnAccoutCheck extends StatelessWidget {
  final bool login;
  final GestureTapCallback onTap;
  const AlreadHaveAnAccoutCheck({
    Key key,
    this.login,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          login ? "Don't have a Accont？" : "Already have a Accont ? ",
          style: TextStyle(color: kPrimaryColor),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            login ? 'Sign up' : "Sign in",
            style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
