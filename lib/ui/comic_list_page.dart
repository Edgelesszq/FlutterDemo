import 'package:flutter/material.dart';
import 'package:flutter_arg_demo/common/Application.dart';
import 'package:flutter_arg_demo/config/intent_key_value.dart';
import 'package:flutter_arg_demo/model/comic_chapter_model.dart';
import 'package:flutter_arg_demo/routers/routes.dart';
import 'package:flutter_arg_demo/viewmodel/comic_chapter_model.dart';
import 'package:flutter_arg_demo/widget/multi_state_widget.dart';
import 'package:flutter_arg_demo/widget/myHomeApp.dart';
import 'package:flutter_arg_demo/widget/providerWidget.dart';

class ComicListPage extends StatelessWidget {
  final String novel_title;
  final String novel_id;

  const ComicListPage({Key key, this.novel_title, this.novel_id})
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
    return new ProviderWidget<ComicChapterModel>(
      model: ComicChapterModel(),
      onReady: (model) {
        model.getComicChapter(novel_id);
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
  final List<Datum> mList;

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
        Datum datum = mList[index];
        return GestureDetector(
          onTap: () {
            Application.router.navigateTo(
              context,
              Routes.comic_content,
              routeSettings: RouteSettings(
                arguments: IntentKeyAndValue(
                    chapterTitle: datum.title, chapterId: datum.chapterId),
              ),
            );
          },
          child: new Container(
            margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10),
            child: ChildItemDecorateBox(datum: datum),
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

  final Datum datum;

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
