// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);
import 'dart:convert';

import 'package:http/http.dart' as http;

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

String categoryToJson(Category data) => json.encode(data.toJson());

class Category {
  Category({
    this.statusCode,
    this.status,
    this.data,
  });

  int? statusCode;
  String? status;
  List<Datum>? data;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        statusCode: json["statusCode"],
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "status": status,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.image,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.lang,
    this.nameEn,
    this.nameUr,
    this.nameAr,
    this.namePs,
  });

  int? id;
  String? image;
  String? name;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? lang;
  String? nameEn;
  String? nameUr;
  String? nameAr;
  String? namePs;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        image: json["image"],
        name: json["name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        lang: json["lang"],
        nameEn: json["name_en"],
        nameUr: json["name_ur"],
        nameAr: json["name_ar"],
        namePs: json["name_ps"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "name": name,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "lang": lang,
        "name_en": nameEn,
        "name_ur": nameUr,
        "name_ar": nameAr,
        "name_ps": namePs,
      };
}

class getCatApi {
  getapiCategories() async {
    http.Response response = await http.get(Uri.parse(
        'https://accountpos.shoaibkanwalacademy.com/mandi_master_admin/public/api/category'));
    print('response==' + response.body.toString());
    if (response.statusCode == 200) {
      final activity = categoryFromJson(response.body);
      return activity;
    } else {
      return null;
    }
  }
}
