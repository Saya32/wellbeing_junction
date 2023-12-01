import 'package:flutter/material.dart';

class SquareBox extends StatelessWidget {
  final String imagePath;
  const SquareBox({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color.fromARGB(18, 255, 187, 1),
            border: Border.all(color: Color.fromARGB(18, 255, 187, 1))),
        child: Image.asset(
          imagePath,
          height: 50,
        ));
  }
}
