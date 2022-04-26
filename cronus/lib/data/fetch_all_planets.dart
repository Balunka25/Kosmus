import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';

Future<AllPlanets> fetchAllPlanets() async {
  final dio = Dio();
  const url2 =" https://api.le-systeme-solaire.net/rest/bodies/";
  final response = await dio.get(url2);
  final json = jsonDecode(response.data.toString());
  final allplanets = AllPlanets.fromJson(json as Map<String, dynamic>);
  return allplanets;
}

class AllPlanets {
  int? count;
  String? next;
  Null previous;
  List<Results> results = [];

  AllPlanets({this.count, this.next, this.previous, this.results = const []});

  AllPlanets.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['count'] = count;
    data['next'] = next;
    data['previous'] = previous;
    if (results != null) {
      data['results'] = results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String? name;

  Results({this.name});

  Results.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['bodies']['name'] = name;
    return data;
  }
}