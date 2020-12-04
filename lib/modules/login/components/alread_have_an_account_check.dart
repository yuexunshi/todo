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
          login ? "Forget Password？" : "Already have a Accont ? ",
          style: TextStyle(color: kPrimaryColor),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            login ? 'Reset password' : "Sign in",
            style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
