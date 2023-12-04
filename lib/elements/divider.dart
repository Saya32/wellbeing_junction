// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class DividerElement extends StatelessWidget {
  const DividerElement({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: const [
          Expanded(
            child: Divider(
              thickness: 1.0,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Text('Or Use',
                style: TextStyle(color: Color.fromARGB(255, 98, 97, 95))),
          ),
          Expanded(
            child: Divider(
              thickness: 1.0,
              color: Color.fromRGBO(0, 0, 0, 1),
            ),
          ),
        ],
      ),
    );
  }
}
