import 'dart:ui';
import 'package:cronus/data/fetch_all_planets.dart';
import 'package:cronus/pages/moon_page.dart';
import 'package:cronus/pages/planet_info.dart';
import 'package:cronus/widgets/circle_column.dart';
import 'package:cronus/widgets/loading_animation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controller/home_controller.dart';
import 'sun_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();
  @override
  void initState() {
    setState(() {
      fetchAllPlanets();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("lib/images/backgroundimage_homepage.jpg"),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              Ink.image(
                image: const AssetImage("lib/images/moon.png"),
                height: 100,
                width: 190,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const MoonPage())));
                  },
                ),
              ),
              const CircleColumn(),
              Container(
                margin: const EdgeInsets.only(left: 30),
                height: 250,
                child: FutureBuilder(
                  future: controller.start(),
                  builder: ((context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.result.bodies!.length,
                        itemBuilder: (context, index) {
                          return Row(children: [
                            ClipRect(
                              child: BackdropFilter(
                                filter:
                                    ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                                child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        color:
                                            Colors.grey[800]!.withOpacity(0.4)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          const SizedBox(height: 10),
                                          Row(
                                            children: [
                                              Container(
                                                height: 130,
                                                width: 130,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          "lib/images/${controller.result.bodies![index].id}.png")),
                                                ),
                                              ),
                                              const SizedBox(width: 30),
                                              Column(
                                                children: [
                                                  Text(
                                                      controller
                                                          .result
                                                          .bodies![index]
                                                          .englishName!,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 28,
                                                        fontFamily: GoogleFonts
                                                                .istokWeb()
                                                            .fontFamily,
                                                      )),
                                                  Text(
                                                      controller.result
                                                          .bodies![index].name!,
                                                      style: TextStyle(
                                                        color: Colors.grey[400],
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: 19,
                                                        fontFamily:
                                                            GoogleFonts.lato()
                                                                .fontFamily,
                                                      )),
                                                ],
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 30),
                                          Container(
                                            margin: const EdgeInsets.only(
                                                right: 70, left: 70),
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  primary: const Color.fromARGB(
                                                      255, 229, 187, 1),
                                                  shape: const StadiumBorder(),
                                                ),
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: ((context) =>
                                                          PlanetInfo(
                                                              id: controller
                                                                  .result
                                                                  .bodies![
                                                                      index]
                                                                  .id!)),
                                                    ),
                                                  );
                                                },
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 6),
                                                      child: Text('EXPLORE',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontFamily:
                                                                GoogleFonts
                                                                        .ubuntu()
                                                                    .fontFamily,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18,
                                                          )),
                                                    ),
                                                    const SizedBox(width: 6),
                                                    const FaIcon(
                                                        FontAwesomeIcons.meteor,
                                                        size: 18),
                                                  ],
                                                )),
                                          )
                                        ],
                                      ),
                                    )),
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            )
                          ]);
                        },
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.none) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              backgroundColor: Colors.white,
                              elevation: 8,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16)),
                              child: ElevatedButton(
                                child: const Text("Try again"),
                                onPressed: () {
                                  setState(() {
                                    controller.start();
                                  });
                                },
                              ),
                            );
                          });
                    }
                    return const LoadingAnimation();
                  }),
                ),
              ),
              const CircleColumn(),
              Ink.image(
                image: const AssetImage("lib/images/sun.png"),
                height: 160,
                width: 160,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const SunPage())));
                  },
                ),
              ),
              const SizedBox(height: 20)
            ],
          )),
    );
  }
}
