import 'package:flutter/material.dart';
import 'package:flutter_arg_demo/viewmodel/chapter_content_model.dart';
import 'package:flutter_arg_demo/widget/multi_state_widget.dart';
import 'package:flutter_arg_demo/widget/myHomeApp.dart';
import 'package:flutter_arg_demo/widget/providerWidget.dart';

class ChapterContentPage extends StatelessWidget {
  final String chapterTitle;
  final String chapterId;

  const ChapterContentPage({Key key, this.chapterTitle, this.chapterId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyHomeApp(
      title: chapterTitle,
      isShowBottomBar: false,
      bodyWidget: ContentListView(
        novel_id: chapterId,
        novel_title: chapterTitle,
      ),
    );
  }
}

class ContentListView extends StatelessWidget {
  final String novel_title;
  final String novel_id;

  const ContentListView({Key key, this.novel_title, this.novel_id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new ProviderWidget<ChapterContentModel>(
      model: ChapterContentModel(),
      onReady: (model) {
        model.getContent(novel_id);
      },
      builder: (context, model, child) {
        return MultiStateWidget(
            state: model.state,
            builder: (context) => ChapterListView(mList: model.content));
      },
    );
  }
}

class ChapterListView extends StatelessWidget {
  final List<String> mList;

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
        String data = mList[index];
        return Container(
          margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10),
          child: ChildItemDecorateBox(content: data),
        );
      },
      scrollDirection: Axis.vertical,
    );
  }
}

class ChildItemDecorateBox extends StatelessWidget {
  const ChildItemDecorateBox({
    Key key,
    this.content,
  }) : super(key: key);

  final String content;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(content),
    );
  }
}
