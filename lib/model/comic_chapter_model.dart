// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

ComicChapterBean welcomeFromJson(String str) =>
    ComicChapterBean.fromJson(json.decode(str));

String welcomeToJson(ComicChapterBean data) => json.encode(data.toJson());

class ComicChapterBean {
  ComicChapterBean({
    this.msg,
    this.code,
    this.data,
  });

  String msg;
  int code;
  Data data;

  factory ComicChapterBean.fromJson(Map<String, dynamic> json) =>
      ComicChapterBean(
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
    this.data,
    this.count,
  });

  List<Datum> data;
  int count;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "count": count,
      };
}

class Datum {
  Datum({
    this.id,
    this.title,
    this.chapterId,
    this.cartoonId,
    this.creationTime,
    this.cartoonVariableId,
  });

  int id;
  String title;
  String chapterId;
  String cartoonId;
  DateTime creationTime;
  int cartoonVariableId;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        chapterId: json["chapterId"],
        cartoonId: json["cartoonId"],
        creationTime: DateTime.parse(json["creationTime"]),
        cartoonVariableId: json["cartoonVariableId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "chapterId": chapterId,
        "cartoonId": cartoonId,
        "creationTime": creationTime.toIso8601String(),
        "cartoonVariableId": cartoonVariableId,
      };
}
