import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_arg_demo/config/static_value.dart';
import 'package:flutter_arg_demo/ui/novel_page.dart';
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
  TextEditingController inputContent = TextEditingController();

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
                  children: <Widget>[
                    new TextField(
                      controller: inputContent,
                      textInputAction: TextInputAction.search,
                      maxLines: 1,
                    )
                  ],
                ),
              ),
              actions: <Widget>[
                new FlatButton(
                  child: new Text('搜索'),
                  onPressed: () {
                    NovelPageState.model.content = inputContent.text;
                    NovelPageState.model.load(false, false);
                    Navigator.pop(context);
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
