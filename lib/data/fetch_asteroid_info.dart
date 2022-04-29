import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<DataAsteroid> fetchAsteroidInfo() async {
  final response = await http
      .get(Uri.parse('https://api.le-systeme-solaire.net/rest/bodies/toutatis'));

  if (response.statusCode == 200) {
    return DataAsteroid.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load DataAsteroid');
  }
}

class DataAsteroid {
  final String id;
  final String englishName;

  const DataAsteroid({
    required this.id,
    required this.englishName,
  });

  factory DataAsteroid.fromJson(Map<String, dynamic> json) {
    return DataAsteroid(
      id: json['id'],
      englishName: json['englishName'],
    );
  }
}
