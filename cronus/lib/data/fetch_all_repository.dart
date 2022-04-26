import 'package:cronus/data/fetch_all_planets.dart';
import 'package:dio/dio.dart';

class FetchAllRepository {
  final dio = Dio();
  final url = 'https://api.le-systeme-solaire.net/rest/bodies/';

  Future<AllPlanets> fetchAll() async {
    final response = await dio.get(url);
    final json = response.data;

    final alllanetsAllPlanets = AllPlanets.fromJson(json);

    return alllanetsAllPlanets;
  }
}