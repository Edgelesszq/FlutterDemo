import 'package:flutter/foundation.dart';
import 'package:flutter_arg_demo/common/BaseViewModel.dart';
import 'package:flutter_arg_demo/common/base_state.dart';
import 'package:flutter_arg_demo/http/api.dart';
import 'package:flutter_arg_demo/http/http_util.dart';
import 'package:flutter_arg_demo/model/video_chapter_bean.dart';

class VideoContentModel extends BaseViewModel {
  List<ElData> dataList = [];

  getVideoChapter(String functionId) {
    state = BaseState.LOADING;
    notifyListeners();
    print(Api.GET_VIDEO_CHAPTER + '$functionId');
    Http().get(Api.GET_VIDEO_CHAPTER + '$functionId', {}, success: (json) {
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

  static VideoChapterBean decode(dynamic json) {
    try {
      return VideoChapterBean.fromJson(json);
    } on Exception {
      return new VideoChapterBean(code: 1, data: null);
    }
  }
}
