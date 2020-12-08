import 'package:flutter/material.dart';

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
