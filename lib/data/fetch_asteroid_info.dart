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
  final num mass;
  final String dimension;
  final String alternativeName;
  final String discoveredBy;
  final String discoveryDate;

  const DataAsteroid({
    required this.id,
    required this.englishName,
    required this.mass,
    required this.dimension,
    required this.alternativeName,
    required this.discoveredBy,
    required this.discoveryDate,
  });

  factory DataAsteroid.fromJson(Map<String, dynamic> json) {
    return DataAsteroid(
      id: json['id'],
      englishName: json['englishName'],
      mass: json['mass']['massValue'],
      dimension: json['dimension'],
      alternativeName: json['alternativeName'],
      discoveredBy: json['discoveredBy'],
      discoveryDate: json['discoveryDate'],
    );
  }
}
