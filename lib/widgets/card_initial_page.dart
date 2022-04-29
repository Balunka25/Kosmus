import 'dart:ui';

import 'package:cronus/widgets/custom_button_explore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../pages/home_page.dart';

class CardInitialPage extends StatelessWidget {
  const CardInitialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
            width: 300.0,
            height: 230.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.grey[800]!.withOpacity(0.6)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),
                    Text("Welcome to",
                        style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white, fontFamily: GoogleFonts.quicksand().fontFamily)),
                    const SizedBox(width: 5),
                    const Text("Kosmus",
                        style: TextStyle(
                          color: Color.fromARGB(255, 135, 18, 9),
                          fontWeight: FontWeight.bold,
                          fontSize: 28
                        )),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Text("The Solar System formed 4.6 billion years ago from the gravitational collapse of a giant interstellar molecular cloud.",
                  style: TextStyle(
                    color: Colors.grey, 
                    fontFamily: GoogleFonts.mulish().fontFamily, 
                    fontSize: 16),
                  textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButtonExplore(
                      text: "Explore Outerspace", 
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => HomePage())));
                      },
                      ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
