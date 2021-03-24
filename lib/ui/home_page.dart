import 'package:flutter/material.dart';
import 'package:flutter_arg_demo/widget/myHomeApp.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyHomeApp(
      showAppBar: false,
      isShowBottomBar: true,
      showBack: false,
      title: '首页',
    );
  }
}
