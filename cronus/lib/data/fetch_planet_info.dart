import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Album> fetchPlanetInfo(String planetName) async {
  final response =
      await http.get(Uri.parse('https://api.le-systeme-solaire.net/rest/bodies/{id}'));

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

class Album{
  final String id;
  final String name;
  final int massValue;
  final int volValue;
  final int density;
  final int gravity;
  final int sideralOrbit;
  final int sideralRotation;
  final String discoveredBy;

const Album(
      {
      required this.id,
      required this.name,
      required this.massValue,
      required this.volValue,
      required this.density,
      required this.gravity,
      required this.sideralOrbit,
      required this.sideralRotation,
      required this.discoveredBy,
      });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
    id: json['id'],
    name: json['name'],
    massValue: json['mass']['massValue'],
    volValue: json['vol']['volValue'] ,
    density: json['density'],
    gravity: json['gravity'],
    sideralOrbit: json['sideralOrbit'],
    sideralRotation: json['sideralRotation'],
    discoveredBy: json['discoveredBy'],
    );
  }
}