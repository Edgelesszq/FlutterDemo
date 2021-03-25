import 'package:flutter/material.dart';
import 'package:flutter_arg_demo/config/static_value.dart';
import 'package:flutter_arg_demo/widget/myHomeApp.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyHomeApp(
      showAppBar: false,
      isShowBottomBar: true,
      showBack: false,
      floatingButton: MyFloatingButton(),
      title: '首页',
    );
  }
}

class MyFloatingButton extends StatelessWidget {
  const MyFloatingButton({
    Key key,
  }) : super(key: key);
  String _getTitleString() {
    if (StaticValue.currentPage == 0) {
      return '搜索漫画';
    } else if (StaticValue.currentPage == 1) {
      return '搜索小说';
    } else if (StaticValue.currentPage == 2) {
      return '搜索视频';
    }
  }

  @override
  Widget build(BuildContext context) {
    return new FloatingActionButton(
      onPressed: () {
        showDialog<Null>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return new AlertDialog(
              title: new Text(_getTitleString()),
              content: new SingleChildScrollView(
                child: new ListBody(
                  children: <Widget>[new TextField()],
                ),
              ),
              actions: <Widget>[
                new FlatButton(
                  child: new Text('搜索'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        ).then((val) {
          print(val);
        });
      },
      child: Icon(Icons.search),
    );
  }
}
