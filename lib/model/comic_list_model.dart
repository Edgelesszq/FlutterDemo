// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

ComicBean welcomeFromJson(String str) => ComicBean.fromJson(json.decode(str));

String welcomeToJson(ComicBean data) => json.encode(data.toJson());

class ComicBean {
  ComicBean({
    this.msg,
    this.code,
    this.data,
  });

  String msg;
  int code;
  Data data;

  factory ComicBean.fromJson(Map<String, dynamic> json) => ComicBean(
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
  List<Datum> data;
  int count;
  int from;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        size: json["size"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
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

class Datum {
  Datum({
    this.id,
    this.title,
    this.descs,
    this.cover,
    this.author,
    this.cartoonType,
    this.cartoonId,
    this.updateTime,
    this.creationTime,
    this.cartoonVariableId,
  });

  int id;
  String title;
  String descs;
  String cover;
  String author;
  String cartoonType;
  String cartoonId;
  DateTime updateTime;
  DateTime creationTime;
  int cartoonVariableId;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        descs: json["descs"],
        cover: json["cover"],
        author: json["author"],
        cartoonType: json["cartoonType"],
        cartoonId: json["cartoonId"],
        updateTime: DateTime.parse(json["updateTime"]),
        creationTime: DateTime.parse(json["creationTime"]),
        cartoonVariableId: json["cartoonVariableId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "descs": descs,
        "cover": cover,
        "author": author,
        "cartoonType": cartoonType,
        "cartoonId": cartoonId,
        "updateTime": updateTime.toIso8601String(),
        "creationTime": creationTime.toIso8601String(),
        "cartoonVariableId": cartoonVariableId,
      };
}
