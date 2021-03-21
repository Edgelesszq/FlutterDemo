import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_arg_demo/routers/routes.dart';
import 'package:flutter_arg_demo/widget/myHomeApp.dart';

import 'common/Application.dart';

void main() {
  final router = FluroRouter();
  Routes.configureRoutes(router);
  Application.router = router;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(primarySwatch: Colors.blue),
      onGenerateRoute: Application.router.generator,
    );
  }
}

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
            child: Text("tiaozhuan"),
          ),
        ),
      ),
    );
  }
}
