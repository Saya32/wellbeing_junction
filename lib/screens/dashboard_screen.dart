import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wellbeing_junction/elements/button.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

void signOutUser() {
  FirebaseAuth.instance.signOut();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    //https://www.edureka.co/community/231021/how-do-i-set-background-image-in-flutter
    return Scaffold(
      appBar: AppBar(title: const Text("Mental Insight"), actions: const [
        IconButton(
          onPressed: signOutUser,
          icon: Icon(Icons.logout),
        )
      ]),
      body: SafeArea(
        child: Center(
          child: Column(children: [
            Image.asset("assets/images/background.jpg"),

            const SizedBox(height: 10), //allows padding
            ButtonElement(onTap: () {}, text: "Questionnaires"),
          ]),
        ),
      ),
    );
  }
}
