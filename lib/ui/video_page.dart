import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_arg_demo/common/Application.dart';
import 'package:flutter_arg_demo/config/intent_key_value.dart';
import 'package:flutter_arg_demo/model/video_list_bean.dart';
import 'package:flutter_arg_demo/routers/routes.dart';
import 'package:flutter_arg_demo/viewmodel/video_model.dart';
import 'package:flutter_arg_demo/widget/multi_state_widget.dart';
import 'package:flutter_arg_demo/widget/providerWidget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class VideoPage extends StatefulWidget {
  @override
  VideoPageState createState() => VideoPageState();
}

class VideoPageState extends State<VideoPage> {
  static VideoModel model;

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<VideoModel>(
      model: model = new VideoModel(),
      onReady: (model) {
        model.load(false, false);
      },
      builder: (context, model, child) {
        return MultiStateWidget(
          builder: (context) => Container(
            child: buildContentView(model.elDataList),
          ),
          state: model.state,
        );
      },
    );
  }
}

Widget buildContentView(List<ElBean> mlist) {
  void _refresh() {
    VideoPageState.model.load(true, false);
  }

  void _loadMore() {
    VideoPageState.model.load(false, true);
  }

  return Container(
    child: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: WaterDropHeader(),
        footer: CustomFooter(builder: (context, mode) {
          Widget body;
          if (mode == LoadStatus.idle) {
            body = Text("上拉加载");
          } else if (mode == LoadStatus.loading) {
            body = CupertinoActivityIndicator();
          } else if (mode == LoadStatus.failed) {
            body = Text("加载失败！点击重试！");
          } else if (mode == LoadStatus.canLoading) {
            body = Text("松手,加载更多!");
          } else {
            body = Text("没有更多数据了!");
          }
          return Container(
            height: 55.0,
            child: Center(child: body),
          );
        }),
        onRefresh: _refresh,
        onLoading: _loadMore,
        controller: VideoPageState.model.refreshController,
        child: ListView.builder(
          itemCount: mlist.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            ElBean elData = mlist[index];
            return GestureDetector(
              onTap: () {
                Application.router.navigateTo(
                  context,
                  Routes.video_list,
                  routeSettings: RouteSettings(
                    arguments: IntentKeyAndValue(
                        title: elData.title, functionId: elData.videoId),
                  ),
                );
              },
              child: ChildItem(elData: elData),
            );
          },
          scrollDirection: Axis.vertical,
        )),
  );
}

class ChildItem extends StatelessWidget {
  const ChildItem({
    Key key,
    @required this.elData,
  }) : super(key: key);

  final ElBean elData;

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

  final ElBean elData;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: [
            //阴影
            BoxShadow(
                color: Colors.black38,
                offset: Offset(1.0, 1.0),
                blurRadius: 4.0)
          ]),
      child: Container(
        height: 260.0,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Image.network(
                elData.cover,
                height: 120.0,
                fit: BoxFit.fitWidth,
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
                  Text(elData.updateTime.toString()),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
