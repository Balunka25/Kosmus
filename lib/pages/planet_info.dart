import 'package:cronus/widgets/card_planets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/fetch_planet_info.dart';
import '../widgets/button_back.dart';
import '../widgets/loading_animation.dart';

class PlanetInfo extends StatefulWidget {
  final String? englishName;
  final String id;
  final double? massValue;
  final double? gravity;
  final double? volValue;
  final String? discoveredBy;
  final String? discoveryDate;

  const PlanetInfo({
    Key? key,
    this.englishName,
    required this.id,
    this.massValue,
    this.gravity,
    this.volValue,
    this.discoveredBy,
    this.discoveryDate,
  }) : super(key: key);

  @override
  State<PlanetInfo> createState() => _PlanetInfoState();
}

class _PlanetInfoState extends State<PlanetInfo> {
  bool toggle = false;
  bool loading = false;
  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchPlanetInfo(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
            Color.fromARGB(255, 193, 3, 3),
            Color.fromARGB(255, 99, 3, 3),
            Colors.black,
            Colors.black,
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                FutureBuilder<Album>(
                  future: futureAlbum,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 10),
                            Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              ButtonBack(color: Colors.white)
                            ],
                          ),
                            Container(
                              height: 300,
                              width: 300,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'lib/images/${snapshot.data!.id}.gif')),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  snapshot.data!.englishName.toUpperCase(),
                                  style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.istokWeb().fontFamily,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(width: 10),
                                const Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            const SizedBox(height: 50),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    CardPlanets(
                                      categoryName: "DENSITY",
                                      categoryResult:
                                          snapshot.data!.density.toString(),
                                      color: Colors.white.withOpacity(0.8),
                                      colorText: Colors.black,
                                    ),
                                    CardPlanets(
                                      categoryName: "MASS",
                                      categoryResult:
                                          snapshot.data!.massValue.toString(),
                                      color: Colors.grey[900]!,
                                      colorText: Colors.white,
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    CardPlanets(
                                      categoryName: "GRAVITY",
                                      categoryResult:
                                          snapshot.data!.gravity.toString(),
                                      color: Colors.grey[900]!,
                                      colorText: Colors.white,
                                    ),
                                    CardPlanets(
                                      categoryName: "VOLUME",
                                      categoryResult:
                                          snapshot.data!.volValue.toString(),
                                      color: Colors.white.withOpacity(0.8),
                                      colorText: Colors.black,
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Discovered by:",
                                  style: TextStyle(
                                      color: const Color.fromARGB(
                                          255, 229, 187, 1),
                                      fontFamily:
                                          GoogleFonts.rubik().fontFamily,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 15),
                                Text(
                                  snapshot.data!.discoveredBy.toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: GoogleFonts.ubuntu().fontFamily,
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Container(
                                height: 1, width: 100, color: Colors.white),
                            const SizedBox(height: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Discovery date:",
                                    style: TextStyle(
                                        color: const Color.fromARGB(
                                            255, 229, 187, 1),
                                        fontFamily:
                                            GoogleFonts.rubik().fontFamily,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(height: 15),
                                Text(
                                    snapshot.data!.discoveryDate.toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily:
                                          GoogleFonts.ubuntu().fontFamily,
                                      fontSize: 20,
                                    )),
                              ],
                            ),
                          ]);
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    // By default, show a loading spinner.
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
