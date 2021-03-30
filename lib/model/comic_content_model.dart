// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

ComicContentBean welcomeFromJson(String str) =>
    ComicContentBean.fromJson(json.decode(str));

String welcomeToJson(ComicContentBean data) => json.encode(data.toJson());

class ComicContentBean {
  ComicContentBean({
    this.msg,
    this.code,
    this.data,
  });

  String msg;
  int code;
  Data data;

  factory ComicContentBean.fromJson(Map<String, dynamic> json) =>
      ComicContentBean(
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

  ContentData data;
  int count;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        data: ContentData.fromJson(json["data"]),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "count": count,
      };
}

class ContentData {
  ContentData({
    this.cartoonVariableId,
    this.creationTime,
    this.chapterId,
    this.cartoonId,
    this.id,
    this.content,
  });

  int cartoonVariableId;
  int creationTime;
  String chapterId;
  String cartoonId;
  int id;
  List<String> content;

  factory ContentData.fromJson(Map<String, dynamic> json) => ContentData(
        cartoonVariableId: json["cartoonVariableId"],
        creationTime: json["creationTime"],
        chapterId: json["chapterId"],
        cartoonId: json["cartoonId"],
        id: json["id"],
        content: List<String>.from(json["content"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "cartoonVariableId": cartoonVariableId,
        "creationTime": creationTime,
        "chapterId": chapterId,
        "cartoonId": cartoonId,
        "id": id,
        "content": List<dynamic>.from(content.map((x) => x)),
      };
}
