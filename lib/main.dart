import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_arg_demo/routers/routes.dart';

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
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: new ThemeData(primarySwatch: Colors.blue),
      onGenerateRoute: Application.router.generator,
    );
  }
}
