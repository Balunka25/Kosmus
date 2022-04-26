import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButtonExplore extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const CustomButtonExplore(
      {Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        // style: ButtonStyle(
        //     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        //         RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(18.0),
        // ))),
        style: ElevatedButton.styleFrom(
          primary: const Color.fromARGB(255, 135, 18, 9),
          shape: const StadiumBorder(),
        ),
        onPressed: onPressed,
        child: Container(
          height: 50,
          width: 220,
          color: const Color.fromARGB(255, 135, 18, 9),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(text,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: GoogleFonts.ubuntu().fontFamily,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  )),
            ],
          ),
        ));
  }
}
