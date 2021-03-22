import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_arg_demo/routers/route_handler.dart';

class Routes {
  static String splash = "/";
  static String home = "/home";

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
      return;
    });
    router.define(splash, handler: splashHandler);
    router.define(home, handler: homeHandler);
  }
}
