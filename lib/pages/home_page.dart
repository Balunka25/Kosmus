import 'dart:ui';

import 'package:cronus/data/fetch_all_planets.dart';
import 'package:cronus/pages/planet_info.dart';
import 'package:cronus/widgets/card_planets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controller/home_controller.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();
  String? imageUrl;
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
              Container(
                margin: EdgeInsets.only(right: 40, left: 40),
                height: 200,
                child: FutureBuilder(
                  future: controller.start(),
                  builder: ((context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return PageView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.result.bodies!.length,
                        itemBuilder: (context, index) {
                          return ClipRect(
                            child: BackdropFilter(
                              filter:
                                  ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                              child: Container(
                                  width: 150,
                                  height: 150,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                      color:
                                          Colors.grey[800]!.withOpacity(0.4)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 10),
                                      // Container(
                                      //   decoration: BoxDecoration(
                                      //     image: DecorationImage(
                                      //         image: AssetImage(
                                      //             imageUrl!)),
                                      //   ),
                                      // ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const SizedBox(height: 10),
                                          Text(
                                              controller.result.bodies![index]
                                                  .englishName!,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 28)),
                                        ],
                                      ),
                                      const SizedBox(height: 80),
                                      Container(
                                        margin: EdgeInsets.only(
                                            right: 40, left: 40),
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: const Color.fromARGB(
                                                  255, 135, 18, 9),
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
                                                              .bodies![index]
                                                              .id!)),
                                                ),
                                              );
                                            },
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text('EXPLORE',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontFamily:
                                                          GoogleFonts.ubuntu()
                                                              .fontFamily,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18,
                                                    )),
                                              ],
                                            )),
                                      )
                                    ],
                                  )),
                            ),
                          );
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
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.purple,
                        strokeWidth: 8.0,
                      ),
                    );
                  }),
                ),
              ),
            ],
          )),
    );
  }
}
