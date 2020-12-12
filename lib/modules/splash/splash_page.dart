/*
 * @Author: your name
 * @Date: 2020-12-08 20:56:00
 * @LastEditTime: 2020-12-12 14:38:37
 * @LastEditors: your name
 * @Description: In User Settings Edit
 * @FilePath: /todo/lib/modules/splash/splash_page.dart
 */
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:todo/modules/splash/splash_controller.dart';
import 'package:todo/r.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SplashController>(
        builder: (_) {
          return Column(
            children: [
              SizedBox(
                height: 120,
              ),
              Text('WELCOME TO HERE',
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(fontWeight: FontWeight.bold)),
              SizedBox(
                height: 120,
              ),
              Image.asset(
                R.assetsImagesSplash,
                fit: BoxFit.fitWidth,
              ),
            ],
          );
        },
      ),
    );
  }
}
