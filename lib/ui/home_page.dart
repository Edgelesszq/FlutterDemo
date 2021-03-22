import 'package:flutter/material.dart';
import 'package:flutter_arg_demo/common/Application.dart';
import 'package:flutter_arg_demo/routers/routes.dart';
import 'package:flutter_arg_demo/widget/myHomeApp.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyHomeApp(
      bodyWidget: new Container(
        child: new Center(
          child: FlatButton(
            onPressed: () {
              Application.router.navigateTo(context, Routes.testPage);
            },
            child: Text('测试跳转'),
          ),
        ),
      ),
    );
  }
}
