import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFFfF35A5);
const kPrimaryLightColor = Color(0xFFF1E6FF);

ThemeData get appThemeData => ThemeData(
      primaryColor: kPrimaryColor,
      scaffoldBackgroundColor: Colors.white,
      accentColor: kPrimaryColor,
      appBarTheme: appBarTheme,
    );

AppBarTheme get appBarTheme => AppBarTheme();
