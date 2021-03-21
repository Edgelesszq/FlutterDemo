import 'package:flutter/material.dart';
import 'package:flutter_arg_demo/widget/myAppBar.dart';

class MyHomeApp extends StatelessWidget {
  final Widget bodyWidget;
  final String title;
  final Color actionColor;
  final bool showBack;
  const MyHomeApp({
    Key key,
    this.bodyWidget,
    this.title,
    this.actionColor,
    this.showBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        titleText: title == null ? "" : title,
        appBarBackColor: actionColor == null ? Colors.black26 : actionColor,
        backShow: showBack == null ? true : showBack,
      ),
      body: bodyWidget,
    );
  }
}
