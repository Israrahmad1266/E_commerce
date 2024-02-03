// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

String categoryToJson(Category data) => json.encode(data.toJson());

class Category {
  bool success;
  List<CategoryElement> categories;

  Category({
    required this.success,
    required this.categories,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        success: json["success"],
        categories: List<CategoryElement>.from(
            json["categories"].map((x) => CategoryElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
      };
}

class CategoryElement {
  String id;
  String name;
  String image;
  String status;
  int v;

  CategoryElement({
    required this.id,
    required this.name,
    required this.image,
    required this.status,
    required this.v,
  });

  factory CategoryElement.fromJson(Map<String, dynamic> json) =>
      CategoryElement(
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
