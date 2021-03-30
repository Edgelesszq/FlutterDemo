import 'package:fluro/fluro.dart';
import 'package:flutter_arg_demo/routers/route_handler.dart';

class Routes {
  static String splash = "/";
  static String home = "/home";
  static String novel_list = "/novel_list";
  static String novel_content = "/novel_content";
  static String comic_list = "/comic_list";
  static String comic_content = "/comic_content";

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(handlerFunc: (context, params) {
      print("ROUTE WAS NOT FOUND !!!");
      return;
    });
    router.define(splash, handler: splashHandler);
    router.define(home, handler: homeHandler);
    router.define(novel_list, handler: novelHandler);
    router.define(novel_content, handler: novelContentHandler);
    router.define(comic_list, handler: comicHandler);
    router.define(comic_content, handler: comicContentHandler);
  }
}
