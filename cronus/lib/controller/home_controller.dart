
import 'package:cronus/data/fetch_all_planets.dart';

import '../data/fetch_all_repository.dart';

class HomeController {
  AllPlanets allplanets = AllPlanets(results: []);
  final repository = FetchAllRepository();
  HomeState state = HomeState.start;

  Future<void> start() async {
    state = HomeState.loading;

      allplanets = await repository.fetchAll();
      state = HomeState.success;

      state = HomeState.error;
    }
  }

enum HomeState { start, loading, success, error }