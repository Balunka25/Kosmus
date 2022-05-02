import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardExpansionTileRow extends StatelessWidget {
  final String categoryName;
  final String categoryResult;
  final Color color;
  final Color colorText;
  const CardExpansionTileRow({
    Key? key,
    required this.categoryName,
    required this.categoryResult,
    required this.color,
    required this.colorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: color),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(categoryName,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  fontFamily: GoogleFonts.kanit().fontFamily,
                )),
            const SizedBox(width: 15),
            Text(categoryResult,
                style: TextStyle(
                  color: colorText,
                  fontSize: 18,
                  fontFamily: GoogleFonts.sourceSansPro().fontFamily,
                )),
          ],
        ),
      ),
    );
  }
}
