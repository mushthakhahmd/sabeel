// To parse this JSON data, do
//
//     final items = itemsFromJson(jsonString);

import 'dart:convert';

Items itemsFromJson(String str) => Items.fromJson(json.decode(str));

String itemsToJson(Items data) => json.encode(data.toJson());

class Items {
  Items(
      {required this.id,
      required this.title,
      required this.subTitle,
      required this.isFavorite,
      required this.imgUrl,
      required this.malayalamTitle});

  int id;
  String title;
  String subTitle;
  bool isFavorite;
  String imgUrl;
  String malayalamTitle;

  factory Items.fromJson(Map<String, dynamic> json) => Items(
        id: json["id"],
        title: json["title"],
        subTitle: json["subTitle"],
        malayalamTitle: json["malayalam_text"] ?? '',
        isFavorite: json["isFavorite"] == "true" ? true : false,
        imgUrl: json["imgUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "subTitle": subTitle,
        "isFavorite": isFavorite,
        "imgUrl": imgUrl,
        "malayalam_text": malayalamTitle,
      };
}
