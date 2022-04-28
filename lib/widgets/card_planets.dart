import 'dart:ui';

import 'package:cronus/widgets/custom_button_explore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../pages/home_page.dart';

class CardPlanets extends StatelessWidget {
  final String categoryName;
  final String categoryResult;
  final Color color;
  final Color colorText;
  const CardPlanets({ Key? key,
  required this.categoryName,
  required this.categoryResult,
  required this.color,
  required this.colorText,
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          height: 150,
          width: 150,
          margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: color),
            child: Column(
              children: [
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width: 15),
                    Text(categoryName,
                        style: TextStyle(
                          color: Color.fromARGB(255, 99, 3, 3),
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          fontFamily: GoogleFonts.kanit().fontFamily,
                        )),
                        const SizedBox(width: 15),
                  ],
                ),
                    const SizedBox(height: 30),
                Text(categoryResult,
                    style: TextStyle(
                      color: colorText,
                      fontSize: 28,
                      fontFamily: GoogleFonts.sourceSansPro().fontFamily,
                    )
                    ),
                    const SizedBox(height: 20)
              ],
            )),
      ),
    );
  }
}