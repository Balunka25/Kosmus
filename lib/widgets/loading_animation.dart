import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoadingAnimation extends StatelessWidget {
  const LoadingAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Container(
          height: 160,
          width: 160,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("lib/images/loading-unscreen.gif"),
                fit: BoxFit.cover),
          ),
        ),
        Text("Loading...",
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: GoogleFonts.ubuntu().fontFamily))
      ],
    ));
  }
}
