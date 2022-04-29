import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<DataMoon> fetchMoonInfo() async {
  final response = await http
      .get(Uri.parse('https://api.le-systeme-solaire.net/rest/bodies/lune'));

  if (response.statusCode == 200) {
    return DataMoon.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load DataMoon');
  }
}

class DataMoon {
  final String id;
  final String name;
  final double density;
  final String englishName;
  final double massValue;
  final double gravity;
  final double volValue;

  const DataMoon({
    required this.id,
    required this.englishName,
    required this.name,
    required this.density,
    required this.gravity,
    required this.massValue,
    required this.volValue,
  });

  factory DataMoon.fromJson(Map<String, dynamic> json) {
    return DataMoon(
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
