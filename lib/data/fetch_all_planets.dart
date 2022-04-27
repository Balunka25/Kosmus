import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';

Future<Result> fetchAllPlanets() async {
  final dio = Dio();
  final url2 ="https://api.le-systeme-solaire.net/rest/bodies/";
  final response = await dio.get(url2);
  final json = jsonDecode(response.data.toString());
  final allplanets = Result.fromJson(json as Map<String, dynamic>);
  return allplanets;
}

class Result {
  List<Bodies>? bodies;

  Result({this.bodies});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['bodies'] != null) {
      bodies = <Bodies>[];
      json['bodies'].forEach((v) {
        bodies!.add(Bodies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.bodies != null) {
      data['bodies'] = this.bodies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Bodies {
  String? id;
  String? name;
  String? englishName;

  Bodies({this.id, this.name, this.englishName});

  Bodies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    englishName = json['englishName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['englishName'] = this.englishName;
    return data;
  }
}