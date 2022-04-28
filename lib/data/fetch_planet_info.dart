import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Album> fetchPlanetInfo(String? planetRel) async {
  final response =
      await http.get(Uri.parse('https://api.le-systeme-solaire.net/rest/bodies/$planetRel'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Album {
  final String id;
  final double density;
  final String englishName;
  final double massValue;
  final double gravity;
  final double volValue;
  final String discoveredBy;
  final String discoveryDate;

  const Album({
    required this.id,
    required this.density,
    required this.englishName,
    required this.massValue,
    required this.gravity,
    required this.volValue,
    required this.discoveredBy,
    required this.discoveryDate,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      density: json['density'],
      englishName: json['englishName'],
      massValue: json['mass']['massValue'],
      gravity: json['gravity'],
      volValue: json['vol']['volValue'],
      discoveredBy: json['discoveredBy'],
      discoveryDate: json['discoveryDate'],
    );
  }
}