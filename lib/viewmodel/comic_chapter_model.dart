import 'package:flutter/foundation.dart';
import 'package:flutter_arg_demo/common/BaseViewModel.dart';
import 'package:flutter_arg_demo/common/base_state.dart';
import 'package:flutter_arg_demo/http/api.dart';
import 'package:flutter_arg_demo/http/http_util.dart';
import 'package:flutter_arg_demo/model/comic_chapter_model.dart';

class ComicChapterModel extends BaseViewModel {
  List<Datum> dataList = [];

  getComicChapter(String comicID) {
    state = BaseState.LOADING;
    notifyListeners();
    print(Api.GET_CARTOON_CHAPTER + '$comicID');
    Http().get(Api.GET_CARTOON_CHAPTER + '$comicID', {}, success: (json) {
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

  static ComicChapterBean decode(dynamic json) {
    try {
      return ComicChapterBean.fromJson(json);
    } on Exception {
      return new ComicChapterBean(code: 1, data: null);
    }
  }
}
