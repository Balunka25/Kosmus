import 'package:flutter/material.dart';

class ButtonBack extends StatelessWidget {
  final Color color;
  const ButtonBack({ Key? key,
  required this.color
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        iconSize: 30,
        color: color,
        onPressed: () {
          Navigator.pop(context);
        });
  }
}