import 'package:cronus/data/fetch_all_planets.dart';
import 'package:dio/dio.dart';

class FetchAllRepository {
  final dio = Dio();
  final url = 'https://api.le-systeme-solaire.net/rest/bodies?filter[]=isPlanet,eq,true';

  Future<Result> fetchAll() async {
    final response = await dio.get(url);
    final json = response.data;

    final results = Result.fromJson(json);

    return results;
  }
}