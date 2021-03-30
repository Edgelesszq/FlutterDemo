// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

NovelChapterModel welcomeFromJson(String str) => NovelChapterModel.fromJson(json.decode(str));

String welcomeToJson(NovelChapterModel data) => json.encode(data.toJson());

class NovelChapterModel {
  NovelChapterModel({
    this.msg,
    this.code,
    this.data,
  });

  String msg;
  int code;
  Data data;

  factory NovelChapterModel.fromJson(Map<String, dynamic> json) => NovelChapterModel(
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
    this.fictionId,
    this.creationTime,
    this.fictionVariableId,
  });

  int id;
  String title;
  String chapterId;
  String fictionId;
  DateTime creationTime;
  int fictionVariableId;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        chapterId: json["chapterId"],
        fictionId: json["fictionId"],
        creationTime: DateTime.parse(json["creationTime"]),
        fictionVariableId: json["fictionVariableId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "chapterId": chapterId,
        "fictionId": fictionId,
        "creationTime": creationTime.toIso8601String(),
        "fictionVariableId": fictionVariableId,
      };
}
