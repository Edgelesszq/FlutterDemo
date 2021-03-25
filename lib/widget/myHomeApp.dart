import 'package:flutter/material.dart';
import 'package:flutter_arg_demo/config/static_value.dart';
import 'package:flutter_arg_demo/ui/comic_page.dart';
import 'package:flutter_arg_demo/ui/novel_page.dart';
import 'package:flutter_arg_demo/ui/video_page.dart';
import 'package:flutter_arg_demo/widget/myAppBar.dart';

class MyHomeApp extends StatefulWidget {
  final Widget bodyWidget;
  final String title;
  final Color actionColor;
  final bool showBack;
  final bool isShowBottomBar;
  final bool showAppBar;
  final Widget floatingButton;
  MyHomeApp({
    Key key,
    this.bodyWidget,
    this.title,
    this.actionColor,
    this.showBack,
    this.isShowBottomBar,
    this.showAppBar = true,
    this.floatingButton,
  }) : super(key: key);
  @override
  MyHomeAppState createState() => MyHomeAppState();
}

class MyHomeAppState extends State<MyHomeApp> {
  final List<Widget> pages = <Widget>[ComicPage(), NovelPage(), VideoPage()];
  void _onItemTapped(int index) {
    setState(() {
      StaticValue.currentPage = index;
    });
  }

  int getCurrentIndex() {
    return StaticValue.currentPage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: (widget.isShowBottomBar)
            ? BottomNavigationBar(
                currentIndex: StaticValue.currentPage,
                onTap: (index) {
                  _onItemTapped(index);
                },
                items: [
                  BottomNavigationBarItem(icon: Icon(Icons.home), label: "漫画"),
                  BottomNavigationBarItem(icon: Icon(Icons.book), label: "小说"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.video_call), label: "视频")
                ],
                type: BottomNavigationBarType.fixed,
              )
            : null,
        appBar: (widget.showAppBar)
            ? MyAppBar(
                titleText: (widget.title == null) ? "" : widget.title,
                appBarBackColor: (widget.actionColor == null)
                    ? Colors.black26
                    : widget.actionColor,
                backShow: (widget.showBack == null) ? true : widget.showBack,
              )
            : null,
        floatingActionButton: widget.floatingButton,
        body: SafeArea(
            child: (widget.isShowBottomBar)
                ? pages[StaticValue.currentPage]
                : widget.bodyWidget));
  }
}
