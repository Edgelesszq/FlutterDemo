import 'package:flutter/material.dart';
import 'package:flutter_arg_demo/config/AppConfig.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color appBarBackColor;
  final String titleText;
  final bool backShow;
  const MyAppBar({
    Key key,
    this.appBarBackColor,
    this.titleText,
    this.backShow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(titleText),
        centerTitle: true,
        backgroundColor: appBarBackColor,
        automaticallyImplyLeading: backShow == null ? true : backShow);
  }

  @override
// TODO: implement preferredSize
  Size get preferredSize {
    return Size.fromHeight(AppConfig.APP_BAR_HEIGHT);
  }
}
