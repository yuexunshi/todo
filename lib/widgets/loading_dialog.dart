import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension GetExtants on GetInterface {
  dismiss() {
    if (Get.isDialogOpen) {
      Get.back();
    }
  }

  loading() {
    if (Get.isDialogOpen) {
      Get.back();
    }
    Get.dialog(LoadingDialog());
  }
}

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: () async => false,
        child: SimpleDialog(key: key, backgroundColor: Colors.white, children: <Widget>[
          Center(
            child: CircularProgressIndicator(),
          )
        ]));
  }
}
