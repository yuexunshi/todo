/*
 * @Author: your name
 * @Date: 2020-12-08 20:56:00
 * @LastEditTime: 2020-12-11 23:06:07
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /todo/lib/main.dart
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/modules/splash/splash_binding.dart';
import 'package:todo/modules/splash/splash_page.dart';
import 'package:todo/routes/app_pages.dart';
import 'package:todo/theme/app_theme.dart';

void main() async {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    builder: (context, child) => Scaffold(
      // Global GestureDetector that will dismiss the keyboard
      body: GestureDetector(
        onTap: () {
          hideKeyboard(context);
        },
        child: child,
      ),
    ),
    theme: appThemeData,
    defaultTransition: Transition.fade,
    getPages: AppPages.pages,
    initialBinding: SplashBinding(),
    home: SplashPage(),
  ));
}

void hideKeyboard(BuildContext context) {
  FocusScopeNode currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
    FocusManager.instance.primaryFocus.unfocus();
  }
}
