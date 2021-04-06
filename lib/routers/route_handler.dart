import 'package:fluro/fluro.dart';
import 'package:flutter_arg_demo/config/intent_key_value.dart';
import 'package:flutter_arg_demo/ui/comic_list_page.dart';
import 'package:flutter_arg_demo/ui/comicl_content_page.dart';
import 'package:flutter_arg_demo/ui/flash_page.dart';
import 'package:flutter_arg_demo/ui/home_page.dart';
import 'package:flutter_arg_demo/ui/novel_content_page.dart';
import 'package:flutter_arg_demo/ui/novel_list_page.dart';
import 'package:flutter_arg_demo/ui/video_list_page.dart';
import 'package:flutter_arg_demo/ui/video_play_page.dart';

var homeHandler = Handler(handlerFunc: (context, params) {
  return HomePage();
});

var splashHandler = Handler(handlerFunc: (context, params) {
  return FlashPage();
});
var novelHandler = Handler(handlerFunc: (context, params) {
  final args = context.settings.arguments as IntentKeyAndValue;
  return NovelListPage(
    novel_title: args.title,
    novel_id: args.functionId,
  );
});
var novelContentHandler = Handler(handlerFunc: (context, params) {
  final args = context.settings.arguments as IntentKeyAndValue;
  return NovelContentPage(
    chapterTitle: args.chapterTitle,
    chapterId: args.chapterId,
  );
});
var comicContentHandler = Handler(handlerFunc: (context, params) {
  final args = context.settings.arguments as IntentKeyAndValue;
  return ComicContentPage(
    chapterTitle: args.chapterTitle,
    chapterId: args.chapterId,
  );
});
var comicHandler = Handler(handlerFunc: (context, params) {
  final args = context.settings.arguments as IntentKeyAndValue;
  return ComicListPage(
    novel_title: args.title,
    novel_id: args.functionId,
  );
});
var videoListHandler = Handler(handlerFunc: (context, params) {
  final args = context.settings.arguments as IntentKeyAndValue;
  return VideoListPage(
    video_title: args.title,
    video_id: args.functionId,
  );
});
var videoPlayHandler = Handler(handlerFunc: (context, params) {
  final args = context.settings.arguments as IntentKeyAndValue;
  return VideoPlayPage(
    video_title: args.chapterTitle,
    video_url: args.chapterId,
  );
});
