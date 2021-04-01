class VideoListBean {
  String msg;
  int code;
  Data data;

  VideoListBean({this.msg, this.code, this.data});

  VideoListBean.fromJson(Map<String, dynamic> json) {
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
  int size;
  List<ElBean> data;
  int count;
  int from;

  Data({this.size, this.data, this.count, this.from});

  Data.fromJson(Map<String, dynamic> json) {
    size = json['size'];
    if (json['data'] != null) {
      data = new List<ElBean>();
      json['data'].forEach((v) {
        data.add(new ElBean.fromJson(v));
      });
    }
    count = json['count'];
    from = json['from'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['size'] = this.size;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['count'] = this.count;
    data['from'] = this.from;
    return data;
  }
}

class ElBean {
  int id;
  String title;
  String descs;
  String cover;
  String author;
  String videoType;
  String videoId;
  String updateTime;
  String creationTime;
  int videoVariableId;

  ElBean(
      {this.id,
      this.title,
      this.descs,
      this.cover,
      this.author,
      this.videoType,
      this.videoId,
      this.updateTime,
      this.creationTime,
      this.videoVariableId});

  ElBean.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    descs = json['descs'];
    cover = json['cover'];
    author = json['author'];
    videoType = json['videoType'];
    videoId = json['videoId'];
    updateTime = json['updateTime'];
    creationTime = json['creationTime'];
    videoVariableId = json['videoVariableId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['descs'] = this.descs;
    data['cover'] = this.cover;
    data['author'] = this.author;
    data['videoType'] = this.videoType;
    data['videoId'] = this.videoId;
    data['updateTime'] = this.updateTime;
    data['creationTime'] = this.creationTime;
    data['videoVariableId'] = this.videoVariableId;
    return data;
  }
}
