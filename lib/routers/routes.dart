import 'package:fluro/fluro.dart';
import 'package:flutter_arg_demo/routers/route_handler.dart';

class Routes {
  static String splash = "/";
  static String home = "/home";
  static String novel_list = "/novel_list";
  static String chapter_content = "/chapter_content";

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(handlerFunc: (context, params) {
      print("ROUTE WAS NOT FOUND !!!");
      return;
    });
    router.define(splash, handler: splashHandler);
    router.define(home, handler: homeHandler);
    router.define(novel_list, handler: novelHandler);
    router.define(chapter_content, handler: chapterHandler);
  }
}
