import 'package:flutter/foundation.dart';
import 'package:flutter_arg_demo/common/BaseViewModel.dart';
import 'package:flutter_arg_demo/common/base_state.dart';
import 'package:flutter_arg_demo/http/api.dart';
import 'package:flutter_arg_demo/http/http_util.dart';
import 'package:flutter_arg_demo/model/novel_search.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MyModel extends BaseViewModel {
  List<ElData> elDataList = [];
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  int page = 1;
  String content = "";

  load(bool isRefresh, bool isLoadMore) {
    if (!isRefresh && !isLoadMore) {
      state = BaseState.LOADING;
      page = 1;
    } else if (isRefresh) {
      page = 1;
    } else if (isLoadMore) {
      page++;
    }
    notifyListeners();
    Http().get2(Api.GET_NOVEL, content, page, success: (json) {
      compute(decode, json).then((value) {
        if (isRefresh) {
          elDataList.clear();
          elDataList.addAll(value.data.data);
          refreshController.refreshCompleted();
        } else if (isLoadMore) {
          state = BaseState.CONTENT;
          if (value.data == null) {
            elDataList.addAll({});
            refreshController.loadNoData();
            page--; //页面-1
          } else {
            refreshController.loadComplete();
            elDataList.addAll(value.data.data);
          }
        } else if (!isRefresh && !isLoadMore) {
          elDataList.clear();
          if (value == null) {
            state = BaseState.EMPTY;
          } else {
            elDataList.addAll(value.data.data);
            state = BaseState.CONTENT;
          }
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
