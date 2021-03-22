import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_arg_demo/ui/home_page.dart';
import 'package:flutter_arg_demo/ui/test_page.dart';

var rootHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return HomePage();
});

var testHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return TestPage();
});
