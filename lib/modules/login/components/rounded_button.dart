import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/theme/app_theme.dart';

class RoundedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color color, textColor;

  const RoundedButton({Key key, this.onPressed, this.text, this.color = kPrimaryColor, this.textColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: FlatButton(
          color: kPrimaryColor,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}
