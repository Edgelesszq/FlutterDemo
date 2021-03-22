import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_arg_demo/ui/flash_page.dart';
import 'package:flutter_arg_demo/ui/home_page.dart';

var homeHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return HomePage();
});

var splashHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return FlashPage();
});
