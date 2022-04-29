import 'package:cronus/data/fetch_asteroid_info.dart';
import 'package:cronus/widgets/info_moon_and_sun_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/fetch_sun_info.dart';
import '../widgets/gradient_text.dart';
import '../widgets/loading_animation.dart';

class AsteroidPage extends StatefulWidget {
  final String? id;
  final String? name;
  final num? density;
  final String? englishName;
  final num? massValue;
  final num? gravity;
  final num? volValue;

  const AsteroidPage({
    Key? key,
    this.englishName,
    this.id,
    this.massValue,
    this.gravity,
    this.volValue,
    this.name,
    this.density,
  }) : super(key: key);

  @override
  State<AsteroidPage> createState() => _AsteroidPageState();
}

class _AsteroidPageState extends State<AsteroidPage> {
  bool toggle = false;
  bool loading = false;
  late Future<DataAsteroid> futureDataAsteroid;

  @override
  void initState() {
    super.initState();
    futureDataAsteroid = fetchAsteroidInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
            Color.fromARGB(255, 0, 37, 97),
            Color.fromARGB(255, 2, 26, 63)
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                FutureBuilder<DataAsteroid>(
                  future: futureDataAsteroid,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        snapshot.data!.englishName,
                        style: TextStyle(
                            fontFamily: GoogleFonts.ubuntu().fontFamily,
                            fontSize: 26,
                            color: Colors.white),
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return const LoadingAnimation();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
