import 'package:cronus/data/fetch_all_planets.dart';
import 'package:cronus/widgets/card_planets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controller/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

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
                            return CardPlanets(planetName: "${controller.result.bodies![0].englishName?.toUpperCase()}");
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
        )
      ),
    );
  }
}