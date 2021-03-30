import 'package:flutter/foundation.dart';
import 'package:flutter_arg_demo/common/BaseViewModel.dart';
import 'package:flutter_arg_demo/common/base_state.dart';
import 'package:flutter_arg_demo/http/api.dart';
import 'package:flutter_arg_demo/http/http_util.dart';
import 'package:flutter_arg_demo/model/novel_chapter_model.dart';

class NovelContentModel extends BaseViewModel {
  List<Datum> dataList = [];

  getNovelChapter(String functionId) {
    state = BaseState.LOADING;
    notifyListeners();
    print(Api.GET_NOVEL_CHAPTER + '$functionId');
    Http().get(Api.GET_NOVEL_CHAPTER + '$functionId', {}, success: (json) {
      compute(decode, json).then((value) {
        if (value == null || value.data == null) {
          state = BaseState.EMPTY;
        } else {
          state = BaseState.CONTENT;
          dataList.addAll(value.data.data);
        }
        notifyListeners();
      });
    }, fail: (reason, statuscode) {
      state = BaseState.FAIL;
      notifyListeners();
    }, after: () {});
  }

  static NovelChapterModel decode(dynamic json) {
    try {
      return NovelChapterModel.fromJson(json);
    } on Exception {
      return new NovelChapterModel(code: 1, data: null);
    }
  }
}
