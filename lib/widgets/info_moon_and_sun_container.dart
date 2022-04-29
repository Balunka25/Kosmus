import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoMoonAndSunContainer extends StatelessWidget {
  final String categoryName;
  final String categoryResult;
  final Color color;
  final Color colorText;
  const InfoMoonAndSunContainer({
    Key? key,
    required this.categoryName,
    required this.categoryResult,
    required this.color,
    required this.colorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: color,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(width: 15),
          Text(categoryName,
              style: TextStyle(
                  color: colorText,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: GoogleFonts.rubik().fontFamily)),
          const SizedBox(width: 15),
          const SizedBox(height: 30),
          Text(categoryResult,
              style: TextStyle(
                  color: colorText,
                  fontSize: 22,
                  fontFamily: GoogleFonts.ubuntu().fontFamily)),
          const SizedBox(width: 20)
        ],
      ),
    );
  }
}
