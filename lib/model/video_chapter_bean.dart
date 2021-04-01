class VideoChapterBean {
  String msg;
  int code;
  Data data;

  VideoChapterBean({this.msg, this.code, this.data});

  VideoChapterBean.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    code = json['code'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  List<ElData> data;
  int count;

  Data({this.data, this.count});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<ElData>();
      json['data'].forEach((v) {
        data.add(new ElData.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['count'] = this.count;
    return data;
  }
}

class ElData {
  int id;
  String title;
  String chapterUrl;
  String videoId;
  String creationTime;
  int videoVariableId;

  ElData(
      {this.id,
      this.title,
      this.chapterUrl,
      this.videoId,
      this.creationTime,
      this.videoVariableId});

  ElData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    chapterUrl = json['chapterUrl'];
    videoId = json['videoId'];
    creationTime = json['creationTime'];
    videoVariableId = json['videoVariableId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['chapterUrl'] = this.chapterUrl;
    data['videoId'] = this.videoId;
    data['creationTime'] = this.creationTime;
    data['videoVariableId'] = this.videoVariableId;
    return data;
  }
}
