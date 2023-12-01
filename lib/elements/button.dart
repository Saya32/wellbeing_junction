import 'dart:ui';

import 'package:flutter/material.dart';

class ButtonElement extends StatelessWidget {
  final Function()? onTap;

  const ButtonElement({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //onTap: ,
      child: Container(
          padding: EdgeInsets.all(18),
          margin: EdgeInsets.symmetric(horizontal: 80),
          decoration: BoxDecoration(
              color: Colors.purple[200],
              borderRadius: BorderRadius.circular(30)),
          child: Center(
              child: Text("Sign In",
                  style:
                      TextStyle(fontSize: 15, fontWeight: FontWeight.bold)))),
    );
  }
}
