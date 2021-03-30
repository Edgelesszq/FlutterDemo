import 'package:fluro/fluro.dart';
import 'package:flutter_arg_demo/config/intent_key_value.dart';
import 'package:flutter_arg_demo/ui/flash_page.dart';
import 'package:flutter_arg_demo/ui/home_page.dart';
import 'package:flutter_arg_demo/ui/novel_content_page.dart';
import 'package:flutter_arg_demo/ui/novel_list_page.dart';

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
var chapterHandler = Handler(handlerFunc: (context, params) {
  final args = context.settings.arguments as IntentKeyAndValue;
  return ChapterContentPage(
    chapterTitle: args.chapterTitle,
    chapterId: args.chapterId,
  );
});
