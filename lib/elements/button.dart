import 'package:flutter/material.dart';

class ButtonElement extends StatelessWidget {
  final Function()? onTap;

  const ButtonElement({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //onTap: ,
      child: Container(
          padding: const EdgeInsets.all(18),
          margin: const EdgeInsets.symmetric(horizontal: 80),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 242, 208, 169),
              borderRadius: BorderRadius.circular(30)),
          child: Center(
              child: Text("Sign In",
                  style:
                      TextStyle(fontSize: 15, fontWeight: FontWeight.bold)))),
    );
  }
}
