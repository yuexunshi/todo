/*
 * @Author: your name
 * @Date: 2020-12-08 20:57:12
 * @LastEditTime: 2020-12-09 22:30:22
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /todo/lib/theme/app_theme.dart
 */
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    textTheme: GoogleFonts.poppinsTextTheme());

AppBarTheme get appBarTheme => AppBarTheme();
