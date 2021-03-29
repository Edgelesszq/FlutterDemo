import 'package:flutter/material.dart';
import 'package:flutter_arg_demo/common/Application.dart';
import 'package:flutter_arg_demo/config/intent_key_value.dart';
import 'package:flutter_arg_demo/model/novel_search.dart';
import 'package:flutter_arg_demo/routers/routes.dart';
import 'package:flutter_arg_demo/viewmodel/novel_model.dart';
import 'package:flutter_arg_demo/widget/multi_state_widget.dart';
import 'package:flutter_arg_demo/widget/providerWidget.dart';

class NovelPage extends StatefulWidget {
  @override
  NovelPageState createState() => NovelPageState();
}

class NovelPageState extends State<NovelPage> {
  static MyModel model;

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<MyModel>(
      model: model = new MyModel(),
      onReady: (model) {
        model.load("");
      },
      builder: (context, model, child) {
        return MultiStateWidget(
          builder: (context) => Container(
            child: buildContentView(model.myData),
          ),
          state: model.state,
        );
      },
    );
  }
}

Widget buildContentView(NovelSearchBean novelSearchBean) {
  List<ElData> dataList = novelSearchBean.data.data;
  return Container(
    child: NovelItemView(dataList: dataList),
  );
}

class NovelItemView extends StatelessWidget {
  const NovelItemView({
    Key key,
    @required this.dataList,
  }) : super(key: key);

  final List<ElData> dataList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dataList.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        ElData elData = dataList[index];
        return GestureDetector(
          onTap: () {
            Application.router.navigateTo(
              context,
              Routes.novel_list,
              routeSettings: RouteSettings(
                arguments: IntentKeyAndValue(
                    title: elData.title, url: elData.cartoonId),
              ),
            );
          },
          child: ChildItem(elData: elData),
        );
      },
      scrollDirection: Axis.vertical,
    );
  }
}

class ChildItem extends StatelessWidget {
  const ChildItem({
    Key key,
    @required this.elData,
  }) : super(key: key);

  final ElData elData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10),
      child: ChildItemDecorateBox(elData: elData),
    );
  }
}

class ChildItemDecorateBox extends StatelessWidget {
  const ChildItemDecorateBox({
    Key key,
    @required this.elData,
  }) : super(key: key);

  final ElData elData;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: [
            //阴影
            BoxShadow(
                color: Colors.black54,
                offset: Offset(2.0, 2.0),
                blurRadius: 4.0)
          ]),
      child: Container(
        height: 150.0,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: [
              Image.network(
                elData.cover,
                width: 100.0,
                height: 120.0,
              ),
              Expanded(
                  child: Column(
                children: [
                  Text(elData.title,
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  Text(elData.author),
                  Text(
                    elData.descs,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(elData.updateTime),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
