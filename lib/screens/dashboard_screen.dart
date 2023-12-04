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
    return Scaffold(
        appBar: AppBar(title: const Text("Mental Insight"), actions: const [
          IconButton(
            onPressed: signOutUser,
            icon: Icon(Icons.logout),
          )
        ]),
        body: Stack(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/background.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18),
                  child: Center(
                    child: ButtonElement(onTap: () {}, text: "Questionnaires"),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
