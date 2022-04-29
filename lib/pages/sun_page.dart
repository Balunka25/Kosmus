import 'package:cronus/widgets/info_moon_and_sun_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/fetch_sun_info.dart';
import '../widgets/gradient_text.dart';
import '../widgets/loading_animation.dart';

class SunPage extends StatefulWidget {
  final String? id;
  final String? name;
  final num? density;
  final String? englishName;
  final num? massValue;
  final num? gravity;
  final num? volValue;

  const SunPage({
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
  State<SunPage> createState() => _SunPageState();
}

class _SunPageState extends State<SunPage> {
  bool toggle = false;
  bool loading = false;
  late Future<DataSun> futureDataSun;

  @override
  void initState() {
    super.initState();
    futureDataSun = fetchSunInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
            Colors.white,
            Color.fromARGB(255, 202, 196, 196),
            Color.fromARGB(255, 255, 232, 85),
            Color.fromARGB(255, 255, 179, 0)
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                FutureBuilder<DataSun>(
                  future: futureDataSun,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(top: 50),
                                  height: 180,
                                  width: 180,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'lib/images/sunReal.png')),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Column(
                                  children: [
                                    const SizedBox(height: 80),
                                    GradientText(
                                      snapshot.data!.englishName.toUpperCase(),
                                      style: TextStyle(
                                          fontFamily:
                                              GoogleFonts.atkinsonHyperlegible()
                                                  .fontFamily,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                      gradient: const LinearGradient(colors: [
                                        Color.fromARGB(255, 255, 145, 0),
                                        Color.fromARGB(255, 255, 179, 0),
                                      ]),
                                    ),
                                  ],
                                ),
                              ]),
                          const SizedBox(height: 50),
                          Container(
                            margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Text(
                              "The Sun is the star at the center of the Solar System. It's heated to incandescence by nuclear fusion reactions in its core. It is by far the most important source of energy for life on Earth.",
                              style: TextStyle(
                                  color: Colors.grey[800],
                                  fontFamily: GoogleFonts.exo().fontFamily,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                color: Colors.white,
                                width: 100,
                                height: 2,
                              ),
                              const SizedBox(width: 10),
                              const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.white,
                                size: 40,
                              ),
                              const SizedBox(width: 10),
                              Container(
                                color: Colors.white,
                                width: 100,
                                height: 2,
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Column(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      InfoMoonAndSunContainer(
                                        categoryName: "Gravity:",
                                        categoryResult:
                                            "${snapshot.data!.gravity.toString()}",
                                        color: const Color.fromARGB(
                                            255, 255, 145, 0),
                                        colorText: Colors.white,
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      InfoMoonAndSunContainer(
                                        categoryName: "Density:",
                                        categoryResult:
                                            "${snapshot.data!.density.toString()}",
                                        color: const Color.fromARGB(
                                            255, 255, 145, 0),
                                        colorText: Colors.white,
                                      )
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(height: 20),
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InfoMoonAndSunContainer(
                                        categoryName: "Volume:",
                                        categoryResult:
                                            "${snapshot.data!.volValue.toString()}",
                                        color: Colors.white,
                                        colorText: Colors.black,
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InfoMoonAndSunContainer(
                                        categoryName: "Mass:",
                                        categoryResult:
                                            "${snapshot.data!.massValue.toString()}",
                                        color: Colors.white,
                                        colorText: Colors.black,
                                      )
                                    ],
                                  )
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
