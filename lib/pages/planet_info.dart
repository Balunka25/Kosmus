import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/fetch_planet_info.dart';

class PlanetInfo extends StatefulWidget {
  final String? englishName;
  final String id;

  const PlanetInfo({Key? key, this.englishName, required this.id}) : super(key: key);

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
            Color.fromARGB(255, 99, 3, 3),
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
                        children: [
                        SizedBox(height: 40),
                        Container(
                        height: 300,
                        width: 300,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('lib/images/uranus.png')),
                            ),
                          ),
                          Text(
                            snapshot.data!.englishName.toUpperCase(),
                            style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.atkinsonHyperlegible()
                                              .fontFamily,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white
                                    ),
                          ),
                          SizedBox(height: 70),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "DENSITY",
                                    style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.atkinsonHyperlegible()
                                              .fontFamily,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[700]
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "${snapshot.data!.density.toString()}",
                                    style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.atkinsonHyperlegible()
                                              .fontFamily,
                                      fontSize: 22,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    // By default, show a loading spinner.
                    return const Center(
                        child: CircularProgressIndicator(
                      color: Colors.purple,
                      strokeWidth: 8.0,
                    ));
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
