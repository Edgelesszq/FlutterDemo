import 'package:flutter/material.dart';
import 'package:flutter_arg_demo/viewmodel/novel_model.dart';
import 'package:flutter_arg_demo/widget/multi_state_widget.dart';
import 'package:flutter_arg_demo/widget/myHomeApp.dart';
import 'package:flutter_arg_demo/widget/providerWidget.dart';

class NovelListPage extends StatelessWidget {
  final String novel_title;
  final String novel_id;

  const NovelListPage({Key key, this.novel_title, this.novel_id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyHomeApp(
      title: novel_title,
      isShowBottomBar: false,
      bodyWidget: NovelListView(
        novel_id: novel_id,
        novel_title: novel_title,
      ),
    );
  }
}

class NovelListView extends StatelessWidget {
  final String novel_title;
  final String novel_id;

  const NovelListView({Key key, this.novel_title, this.novel_id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new ProviderWidget(
      model: new MyModel(),
      onReady: (model) {},
      builder: (context, model, child) {
        return MultiStateWidget(
          builder: (context) => Container(
            child: new Text(novel_title),
          ),
        );
      },
    );
  }
}
