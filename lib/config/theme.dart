import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData theme() {
  return ThemeData(
    primaryColor: const Color.fromARGB(255, 186, 34, 23),
    fontFamily: GoogleFonts.mukta().fontFamily,
    textTheme: TextTheme(
      headline1: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.normal,
        fontSize: 32,
      ),
      headline2: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.normal,
        fontSize: 24,
      ),
      headline3: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.normal,
        fontSize: 20,
      ),
      headline4: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.normal,
        fontSize: 16,
      ),
      headline5: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.normal,
        fontSize: 14,
      ),
      headline6: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.normal,
        fontSize: 14,
      ),
      bodyText1: TextStyle(
          fontFamily: GoogleFonts.atkinsonHyperlegible().fontFamily,
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.grey[700]),
      bodyText2: TextStyle(
        fontFamily: GoogleFonts.atkinsonHyperlegible().fontFamily,
        fontSize: 22,
        color: Colors.white,
      ),
    ),
  );
}
