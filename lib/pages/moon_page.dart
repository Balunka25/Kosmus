import 'package:cronus/data/fetch_moon_info.dart';
import 'package:cronus/widgets/info_moon_and_sun_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/button_back.dart';
import '../widgets/gradient_text.dart';
import '../widgets/loading_animation.dart';

class MoonPage extends StatefulWidget {
  final String? englishName;
  final String? id;
  final double? massValue;
  final double? gravity;
  final double? volValue;
  final double? density;

  const MoonPage({
    Key? key,
    this.englishName,
    this.id,
    this.massValue,
    this.gravity,
    this.volValue,
    this.density,
  }) : super(key: key);

  @override
  State<MoonPage> createState() => _MoonPageState();
}

class _MoonPageState extends State<MoonPage> {
  bool toggle = false;
  bool loading = false;
  late Future<DataMoon> futureDataMoon;

  @override
  void initState() {
    super.initState();
    futureDataMoon = fetchMoonInfo();
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
            Color.fromARGB(255, 72, 72, 72),
            Colors.black,
          ])),
      child: Scaffold(    
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                FutureBuilder<DataMoon>(
                  future: futureDataMoon,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              ButtonBack(color: Colors.black)
                            ],
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 180,
                                  width: 180,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'lib/images/moonReal.png')),
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
                                      gradient: LinearGradient(colors: [
                                        Colors.grey[400]!,
                                        Colors.grey[800]!,
                                      ]),
                                    ),
                                  ],
                                ),
                              ]),
                          const SizedBox(height: 50),
                          Container(
                            margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Text(
                              "The Moon is Earth's only natural satellite. At about one-quarter the diameter of Earth, it is the fifth largest satellite in the Solar System and the largest satellite in the Solar System",
                              style: TextStyle(
                                  color: Colors.grey[800],
                                  fontFamily: GoogleFonts.mulish().fontFamily,
                                  fontSize: 16,
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
                                        color: Colors.black,
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
                                        color: Colors.black,
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
