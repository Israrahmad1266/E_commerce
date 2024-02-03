// To parse this JSON data, do
//
//     final subcategory = subcategoryFromJson(jsonString);

import 'dart:convert';

Subcategory subcategoryFromJson(String str) =>
    Subcategory.fromJson(json.decode(str));

String subcategoryToJson(Subcategory data) => json.encode(data.toJson());

class Subcategory {
  int status;
  String message;
  List<Datum> data;

  Subcategory({
    required this.status,
    required this.message,
    required this.data,
  });

  factory Subcategory.fromJson(Map<String, dynamic> json) => Subcategory(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  String id;
  CategoryId categoryId;
  String name;
  String image;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  Datum({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.image,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        categoryId: CategoryId.fromJson(json["categoryId"]),
        name: json["name"],
        image: json["image"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "categoryId": categoryId.toJson(),
        "name": name,
        "image": image,
        "status": status,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}

class CategoryId {
  String id;
  String name;
  String image;
  String status;
  int v;

  CategoryId({
    required this.id,
    required this.name,
    required this.image,
    required this.status,
    required this.v,
  });

  factory CategoryId.fromJson(Map<String, dynamic> json) => CategoryId(
        id: json["_id"],
        name: json["name"],
        image: json["image"],
        status: json["status"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "image": image,
        "status": status,
        "__v": v,
      };
}
