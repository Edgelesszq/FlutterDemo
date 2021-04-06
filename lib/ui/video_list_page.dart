import 'package:flutter/material.dart';
import 'package:flutter_arg_demo/common/Application.dart';
import 'package:flutter_arg_demo/config/intent_key_value.dart';
import 'package:flutter_arg_demo/model/video_chapter_bean.dart';
import 'package:flutter_arg_demo/routers/routes.dart';
import 'package:flutter_arg_demo/viewmodel/video_chapter_model.dart';
import 'package:flutter_arg_demo/widget/multi_state_widget.dart';
import 'package:flutter_arg_demo/widget/myHomeApp.dart';
import 'package:flutter_arg_demo/widget/providerWidget.dart';

class VideoListPage extends StatelessWidget {
  final String video_title;
  final String video_id;

  const VideoListPage({Key key, this.video_title, this.video_id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyHomeApp(
      title: video_title,
      isShowBottomBar: false,
      bodyWidget: VideoListView(
        video_id: video_id,
        video_title: video_title,
      ),
    );
  }
}

class VideoListView extends StatelessWidget {
  final String video_title;
  final String video_id;

  const VideoListView({Key key, this.video_title, this.video_id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new ProviderWidget<VideoContentModel>(
      model: VideoContentModel(),
      onReady: (model) {
        model.getVideoChapter(video_id);
      },
      builder: (context, model, child) {
        return MultiStateWidget(
            state: model.state,
            builder: (context) => ChapterListView(mList: model.dataList));
      },
    );
  }
}

class ChapterListView extends StatelessWidget {
  final List<ElData> mList;

  const ChapterListView({
    Key key,
    this.mList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: mList.length,
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        ElData elData = mList[index];
        return GestureDetector(
          onTap: () {
            Application.router.navigateTo(
              context,
              Routes.video_play,
              routeSettings: RouteSettings(
                arguments: IntentKeyAndValue(
                    chapterTitle: elData.title, chapterId: elData.chapterUrl),
              ),
            );
          },
          child: new Container(
            margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10),
            child: ChildItemDecorateBox(datum: elData),
          ),
        );
      },
      scrollDirection: Axis.vertical,
    );
  }
}

class ChildItemDecorateBox extends StatelessWidget {
  const ChildItemDecorateBox({
    Key key,
    this.datum,
  }) : super(key: key);

  final ElData datum;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(1.0),
          boxShadow: [
            //阴影
            BoxShadow(
                color: Colors.black38,
                offset: Offset(1.0, 1.0),
                blurRadius: 2.0)
          ]),
      child: Container(
        height: 50.0,
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: Row(
            children: [
              Expanded(
                child: Text(datum.title),
              )
            ],
          ),
        ),
      ),
    );
  }
}
