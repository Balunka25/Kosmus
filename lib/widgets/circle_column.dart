import 'package:flutter/material.dart';

class CircleColumn extends StatelessWidget {
  const CircleColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(Icons.circle, size: 5, color: Colors.white),
        SizedBox(height: 6),
        Icon(Icons.circle, size: 5, color: Colors.white),
        SizedBox(height: 6),
        Icon(Icons.circle, size: 5, color: Colors.white),
        SizedBox(height: 6),
        Icon(Icons.circle, size: 5, color: Colors.white),
        SizedBox(height: 6),
        Icon(Icons.circle, size: 5, color: Colors.white),
        SizedBox(height: 6),
        Icon(Icons.circle, size: 5, color: Colors.white),
        SizedBox(height: 6),
        Icon(Icons.circle, size: 5, color: Colors.white),
      ],
    );
  }
}
