import 'package:flutter/foundation.dart';
import 'package:flutter_arg_demo/common/BaseViewModel.dart';
import 'package:flutter_arg_demo/common/base_state.dart';
import 'package:flutter_arg_demo/http/api.dart';
import 'package:flutter_arg_demo/http/http_util.dart';
import 'package:flutter_arg_demo/model/novel_search.dart';

class MyModel extends BaseViewModel {
  NovelSearchBean myData;

  load() {
    state = BaseState.LOADING;
    notifyListeners();
    Http().get(Api.GET_NOVEL, {}, success: (json) {
      compute(decode, json).then((value) {
        if (value == null) {
          state = BaseState.EMPTY;
        } else {
          state = BaseState.CONTENT;
          myData = value;
        }
        notifyListeners();
      });
    }, fail: (reason, statuscode) {
      state = BaseState.FAIL;
      notifyListeners();
    }, after: () {});
  }

  static NovelSearchBean decode(dynamic json) {
    return NovelSearchBean.fromJson(json);
  }
}
