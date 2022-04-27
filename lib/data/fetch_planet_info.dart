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

  const Album({
    required this.id,
    required this.density,
    required this.englishName
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      density: json['density'],
      englishName: json['englishName']
    );
  }
}
// class Album {
//   String? id;
//   double? density;

//   Album({required this.id, required this.density});

//   Album.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     density = json['density'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     data['id'] = id;
//     data['density'] = density;
//     return data;
//   }
// }