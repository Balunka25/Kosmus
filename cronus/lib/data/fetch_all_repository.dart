// import 'package:dio/dio.dart';
// import 'fetch_planets.dart';

// class FetchAllRepository {
//   final dio = Dio();
//   final url = 'https://api.le-systeme-solaire.net/rest/bodies';

//   Future<AllPlanets> fetchAll() async {
//     final response = await dio.get(url);
//     final json = response.data;

//     final allplanets = AllPlanets.fromJson(json);

//     return allplanets;
//   }
// }