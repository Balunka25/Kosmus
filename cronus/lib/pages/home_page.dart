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
      controller.start();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("lib/images/backgroundimage_homepage.jpg"), 
              fit: BoxFit.cover),
        ),
    child: FutureBuilder(
          future: controller.start(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemCount: controller.allplanets.results.length,
                itemBuilder: (context, index) {
                  return  ListTile(
                      title: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8, 36, 8),
                        child: Text(
                          "${controller.allplanets.results[index].name?.toUpperCase()}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily:
                                GoogleFonts.atkinsonHyperlegible().fontFamily,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 48),
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
        ))
    );
  }
}