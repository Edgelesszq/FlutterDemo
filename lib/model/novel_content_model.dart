// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

NovelChapterContentModel welcomeFromJson(String str) => NovelChapterContentModel.fromJson(json.decode(str));

String welcomeToJson(NovelChapterContentModel data) => json.encode(data.toJson());

class NovelChapterContentModel {
  NovelChapterContentModel({
    this.msg,
    this.code,
    this.data,
  });

  String msg;
  int code;
  Data data;

  factory NovelChapterContentModel.fromJson(Map<String, dynamic> json) => NovelChapterContentModel(
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
    this.creationTime,
    this.chapterId,
    this.fictionId,
    this.fictionVariableId,
    this.id,
    this.content,
  });

  int creationTime;
  String chapterId;
  String fictionId;
  int fictionVariableId;
  int id;
  List<String> content;

  factory ContentData.fromJson(Map<String, dynamic> json) => ContentData(
    creationTime: json["creationTime"],
    chapterId: json["chapterId"],
    fictionId: json["fictionId"],
    fictionVariableId: json["fictionVariableId"],
    id: json["id"],
    content: List<String>.from(json["content"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "creationTime": creationTime,
    "chapterId": chapterId,
    "fictionId": fictionId,
    "fictionVariableId": fictionVariableId,
    "id": id,
    "content": List<dynamic>.from(content.map((x) => x)),
  };
}
