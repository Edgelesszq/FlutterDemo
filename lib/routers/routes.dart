import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_arg_demo/routers/route_handler.dart';

class Routes {
  static String root = "/";
  static String testPage = "/test";

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
      return;
    });
    router.define(root, handler: rootHandler);
    router.define(testPage, handler: testHandler);
  }
}
