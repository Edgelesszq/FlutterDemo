import 'package:flutter/foundation.dart';
import 'package:flutter_arg_demo/common/BaseViewModel.dart';
import 'package:flutter_arg_demo/common/base_state.dart';
import 'package:flutter_arg_demo/http/api.dart';
import 'package:flutter_arg_demo/http/http_util.dart';
import 'package:flutter_arg_demo/model/novel_content_model.dart';

class ChapterContentModel extends BaseViewModel {
  List<String> content = [];

  getContent(String contentId) {
    state = BaseState.LOADING;
    notifyListeners();
    print(Api.GET_CHAPTER_CONTENT + '$contentId');
    Http().get(Api.GET_CHAPTER_CONTENT + '$contentId', {}, success: (json) {
      compute(decode, json).then((value) {
        print('--------------------' + value.toString());
        if (value == null || value.data == null) {
          state = BaseState.EMPTY;
        } else {
          state = BaseState.CONTENT;
          content.addAll(value.data.data.content);
        }
        notifyListeners();
      });
    }, fail: (reason, statuscode) {
      state = BaseState.FAIL;
      notifyListeners();
    }, after: () {});
  }

  static NovelChapterContentModel decode(dynamic json) {
    try {
      return NovelChapterContentModel.fromJson(json);
    } on Exception {
      return NovelChapterContentModel(code: 1, data: null);
    }
  }
}
