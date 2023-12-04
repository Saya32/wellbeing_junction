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
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 80),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color.fromRGBO(0, 0, 0, 1),
            border: Border.all(color: Color.fromRGBO(0, 0, 0, 1))),
        child: Row(
          children: [
            Image.asset(
              imagePath,
              height: 50,
            ),
            const SizedBox(width: 20.0),
            const Text('Login with Google',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ],
        ));
  }
}
