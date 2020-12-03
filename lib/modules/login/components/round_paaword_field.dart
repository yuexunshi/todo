import 'package:flutter/material.dart';
import 'package:todo/modules/login/components/text_field_container.dart';
import 'package:todo/theme/app_theme.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'Password',
          icon: Icon(Icons.lock, color: kPrimaryColor),
          suffixIcon: Icon(Icons.visibility, color: kPrimaryColor),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
