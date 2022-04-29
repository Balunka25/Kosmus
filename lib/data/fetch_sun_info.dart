import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<DataSun> fetchSunInfo() async {
  final response = await http
      .get(Uri.parse('https://api.le-systeme-solaire.net/rest/bodies/soleil'));

  if (response.statusCode == 200) {
    return DataSun.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load DataSun');
  }
}

class DataSun {
  final String id;
  final String name;
  final num density;
  final String englishName;
  final num massValue;
  final num gravity;
  final num volValue;

  const DataSun({
    required this.id,
    required this.englishName,
    required this.name,
    required this.density,
    required this.gravity,
    required this.massValue,
    required this.volValue,
  });

  factory DataSun.fromJson(Map<String, dynamic> json) {
    return DataSun(
      id: json['id'],
      englishName: json['englishName'],
      name: json['name'],
      density: json['density'],
      gravity: json['gravity'],
      massValue: json['mass']['massValue'],
      volValue: json['vol']['volValue'],
    );
  }
}
