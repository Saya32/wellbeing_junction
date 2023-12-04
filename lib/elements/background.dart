import 'package:flutter/material.dart';

class Background extends StatelessWidget { //https://www.edureka.co/community/231021/how-do-i-set-background-image-in-flutter
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
