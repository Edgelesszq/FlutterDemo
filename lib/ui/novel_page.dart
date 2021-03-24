import 'package:flutter/material.dart';
import 'package:flutter_arg_demo/model/novel_search.dart';
import 'package:flutter_arg_demo/viewmodel/myModel.dart';
import 'package:flutter_arg_demo/widget/multi_state_widget.dart';
import 'package:flutter_arg_demo/widget/providerWidget.dart';

class NovelPage extends StatefulWidget {
  @override
  _NovelPageState createState() => _NovelPageState();
}

class _NovelPageState extends State<NovelPage> {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<MyModel>(
      model: MyModel(),
      onReady: (model) {
        model.load();
      },
      builder: (context, model, child) {
        return MultiStateWidget(
          builder: (context) => Center(
            child: Text(model.myData.msg),
          ),
          state: model.state,
        );
      },
    );
  }
}

Widget buildContentView(NovelSearchBean novelSearchBean) {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text("NIUBI"),
        ),
      ],
    ),
  );
}
