import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFFc44dff);
const kPrimaryLightColor = Color(0xFFf0d3ff);
const primaryDarkColor = Color(0xFF8936b3);
const secondaryColor = Color(0xFFe1a6ff);
const secondaryLightColor = Color(0xFFe1a6ff);
const secondaryDarkColor = Color(0xFFe1a6ff);
// const primaryTextColor = Color(0xFFF1E6FF);
// const secondaryTextColor = Color(0xFFF1E6FF);

ThemeData get appThemeData => ThemeData(
      primaryColor: kPrimaryColor,
      primaryColorLight: kPrimaryLightColor,
      scaffoldBackgroundColor: Colors.white,
      accentColor: kPrimaryColor,
      appBarTheme: appBarTheme,
    );

AppBarTheme get appBarTheme => AppBarTheme();
