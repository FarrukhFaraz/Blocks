import 'package:http/http.dart' as http;
import 'dart:convert';
// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    this.data,
    this.message,
    this.success,
    this.status,
  });

  List<Datummm>? data;
  String? message;
  bool? success;
  int? status;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    data: List<Datummm>.from(json["data"].map((x) => Datummm.fromJson(x))),
    message: json["Message"],
    success: json["success"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "Message": message,
    "success": success,
    "status": status,
  };
}

class Datummm {
  Datummm({
    this.id,
    this.name,
    this.photo,
  });

  int? id;
  String? name;
  String? photo;

  factory Datummm.fromJson(Map<String, dynamic> json) => Datummm(
    id: json["id"],
    name: json["name"],
    photo: json["photo"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "photo": photo,
  };
}


class classApi{
  Future<Welcome> getApi() async{
    http.Response response=await http.get(Uri.parse('https://dailashop2.shoaibkanwalacademy.com/api/v2/categories'));
    print(response.body);
    var data11= jsonDecode(response.body);
    List<Datummm>? data= Welcome.fromJson(data11).data;
    final activity= welcomeFromJson(response.body);
    return activity;
  }
}