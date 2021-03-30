// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

NovelSearchBean welcomeFromJson(String str) =>
    NovelSearchBean.fromJson(json.decode(str));

String welcomeToJson(NovelSearchBean data) => json.encode(data.toJson());

class NovelSearchBean {
  NovelSearchBean({
    this.msg,
    this.code,
    this.data,
  });

  String msg;
  int code;
  Data data;

  factory NovelSearchBean.fromJson(Map<String, dynamic> json) =>
      NovelSearchBean(
        msg: json["msg"],
        code: json["code"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "code": code,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.size,
    this.data,
    this.count,
    this.from,
  });

  int size;
  List<ElData> data;
  int count;
  int from;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        size: json["size"],
        data: List<ElData>.from(json["data"].map((x) => ElData.fromJson(x))),
        count: json["count"],
        from: json["from"],
      );

  Map<String, dynamic> toJson() => {
        "size": size,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "count": count,
        "from": from,
      };
}

class ElData {
  ElData({
    this.id,
    this.title,
    this.descs,
    this.cover,
    this.author,
    this.fictionType,
    this.fictionId,
    this.updateTime,
    this.creationTime,
    this.fictionVariableId,
  });

  int id;
  String title;
  String descs;
  String cover;
  String author;
  String fictionType;
  String fictionId;
  DateTime updateTime;
  DateTime creationTime;
  int fictionVariableId;

  factory ElData.fromJson(Map<String, dynamic> json) => ElData(
        id: json["id"],
        title: json["title"],
        descs: json["descs"],
        cover: json["cover"],
        author: json["author"],
        fictionType: json["fictionType"],
        fictionId: json["fictionId"],
        updateTime: DateTime.parse(json["updateTime"]),
        creationTime: DateTime.parse(json["creationTime"]),
        fictionVariableId: json["fictionVariableId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "descs": descs,
        "cover": cover,
        "author": author,
        "fictionType": fictionType,
        "fictionId": fictionId,
        "updateTime": updateTime.toIso8601String(),
        "creationTime": creationTime.toIso8601String(),
        "fictionVariableId": fictionVariableId,
      };
}
