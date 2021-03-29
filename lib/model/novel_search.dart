class NovelSearchBean {
  String _msg;
  int _code;
  Data _data;

  NovelSearchBean({String msg, int code, Data data}) {
    this._msg = msg;
    this._code = code;
    this._data = data;
  }

  String get msg => _msg;

  set msg(String msg) => _msg = msg;

  int get code => _code;

  set code(int code) => _code = code;

  Data get data => _data;

  set data(Data data) => _data = data;

  NovelSearchBean.fromJson(Map<String, dynamic> json) {
    _msg = json['msg'];
    _code = json['code'];
    _data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this._msg;
    data['code'] = this._code;
    if (this._data != null) {
      data['data'] = this._data.toJson();
    }
    return data;
  }
}

class Data {
  int _size;
  List<ElData> _data;
  int _count;
  int _from;

  Data({int size, List<ElData> data, int count, int from}) {
    this._size = size;
    this._data = data;
    this._count = count;
    this._from = from;
  }

  int get size => _size;

  set size(int size) => _size = size;

  List<ElData> get data => _data;

  set data(List<ElData> data) => _data = data;

  int get count => _count;

  set count(int count) => _count = count;

  int get from => _from;

  set from(int from) => _from = from;

  Data.fromJson(Map<String, dynamic> json) {
    _size = json['size'];
    if (json['data'] != null) {
      _data = new List<ElData>();
      json['data'].forEach((v) {
        _data.add(new ElData.fromJson(v));
      });
    }
    _count = json['count'];
    _from = json['from'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['size'] = this._size;
    if (this._data != null) {
      data['data'] = this._data.map((v) => v.toJson()).toList();
    }
    data['count'] = this._count;
    data['from'] = this._from;
    return data;
  }
}

class ElData {
  int _id;
  String _title;
  String _descs;
  String _cover;
  String _author;
  String _cartoonType;
  String _cartoonId;
  String _updateTime;
  String _creationTime;
  int _cartoonVariableId;

  ElData(
      {int id,
      String title,
      String descs,
      String cover,
      String author,
      String cartoonType,
      String cartoonId,
      String updateTime,
      String creationTime,
      int cartoonVariableId}) {
    this._id = id;
    this._title = title;
    this._descs = descs;
    this._cover = cover;
    this._author = author;
    this._cartoonType = cartoonType;
    this._cartoonId = cartoonId;
    this._updateTime = updateTime;
    this._creationTime = creationTime;
    this._cartoonVariableId = cartoonVariableId;
  }

  int get id => _id;

  set id(int id) => _id = id;

  String get title => _title;

  set title(String title) => _title = title;

  String get descs => _descs;

  set descs(String descs) => _descs = descs;

  String get cover => _cover;

  set cover(String cover) => _cover = cover;

  String get author => _author;

  set author(String author) => _author = author;

  String get cartoonType => _cartoonType;

  set cartoonType(String cartoonType) => _cartoonType = cartoonType;

  String get cartoonId => _cartoonId;

  set cartoonId(String cartoonId) => _cartoonId = cartoonId;

  String get updateTime => _updateTime;

  set updateTime(String updateTime) => _updateTime = updateTime;

  String get creationTime => _creationTime;

  set creationTime(String creationTime) => _creationTime = creationTime;

  int get cartoonVariableId => _cartoonVariableId;

  set cartoonVariableId(int cartoonVariableId) =>
      _cartoonVariableId = cartoonVariableId;

  ElData.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _title = json['title'];
    _descs = json['descs'];
    _cover = json['cover'];
    _author = json['author'];
    _cartoonType = json['cartoonType'];
    _cartoonId = json['cartoonId'];
    _updateTime = json['updateTime'];
    _creationTime = json['creationTime'];
    _cartoonVariableId = json['cartoonVariableId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['title'] = this._title;
    data['descs'] = this._descs;
    data['cover'] = this._cover;
    data['author'] = this._author;
    data['cartoonType'] = this._cartoonType;
    data['cartoonId'] = this._cartoonId;
    data['updateTime'] = this._updateTime;
    data['creationTime'] = this._creationTime;
    data['cartoonVariableId'] = this._cartoonVariableId;
    return data;
  }
}
