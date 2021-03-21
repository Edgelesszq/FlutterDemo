import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_arg_demo/main.dart';
import 'package:flutter_arg_demo/ui/TestPage.dart';

var rootHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return HomePage();
});

var testHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return TestPage();
});
