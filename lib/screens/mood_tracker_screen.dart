import 'package:flutter/material.dart';
import 'package:wellbeing_junction/elements/background.dart';

class UserDataScreen extends StatelessWidget {
  const UserDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          Background(), 
          Center(

            child: Text(
              "User data will be displayed on this screen!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20, 
                fontWeight: FontWeight.bold, 
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
