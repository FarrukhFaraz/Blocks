// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:iyoutrader/Utils/url.dart';

CategoryModel categoryModelFromJson(String str) =>
    CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  CategoryModel({
    required this.st,
    required this.msg,
    required this.data,
  });

  int st;
  String msg;
  List<Datum> data;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        st: json["st"],
        msg: json["msg"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "st": st,
        "msg": msg,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.title,
    required this.status,
    required this.image,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int id;
  String title;
  String status;
  String image;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic deletedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        status: json["status"],
        image: json["image"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "status": status,
        "image": image,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
      };
}

class CallCategoryApi {
  Future<CategoryModel> getcategories() async {
    print('calling api');
    print(categoriesUrl);
    http.Response response = await http.get(Uri.parse(categoriesUrl));
    //return (response.data['data'] as List).map((child)=> Children.fromJson(child)).toList();
    print('ppppp' + response.body.toString());
    var data1 = jsonDecode(response.body);
    List<Datum> data = CategoryModel.fromJson(data1).data;
    final activity = categoryModelFromJson(response.body);
    print('response===' + activity.toString());
    return activity;
  }
}
